import FirebaseAuth
import Foundation
import Firebase
import SwiftUI



enum FocusedField{
    case email
    case password
}

@MainActor
class AkeLoginViewModel:ObservableObject{
    
    
    @Published var email = ""
    @Published var password = ""
    @Published var isValidEmail = true
    @Published var isValidPassword = true
    
    @Published var userSession:FirebaseAuth.User?
    @Published var currentUser:UserModel?
    
    @Published var errorMessage: String? = nil
    @Published var showSuccessAnimation = false
    @Published var successMessage: String? = nil
   
    @AppStorage("isAkeLoggedIn") var isAkeLoggedIn: Bool = false
    
    @Published var messages:[Message]  = []
    
    var canProceed:Bool {
        validateEmail(email)
    }
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
            
        }
        if isAkeLoggedIn{
            showSuccessAnimation = true
            DispatchQueue.main.asyncAfter(deadline: .now()+2){ [weak self] in
                self?.showSuccessAnimation = false
            }
        }
        
        MessageDataBaseManagerPractice.shared.listenForNewMessages{[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let messages):
                    self?.messages = messages
                case .failure(let error):
                    print(error)
                    // Hata durumunda ne yapılacağını burada işleyebilirsiniz.
                }
            }
        }
       
    }
    

    func signIn(withEmail:String, withPassword:String )async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: withPassword)
            self.userSession = result.user
             await fetchUser()
            self.isAkeLoggedIn = true
            self.email  = ""
            self.password  = ""
            
            
        }catch{
            print("Failed to login with error:\(error.localizedDescription)")
            self.errorMessage = "Giriş yapılamadı. Lütfen e-posta ve şifrenizi kontrol edin."
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
            self.isAkeLoggedIn = false
          
        }catch{
            
        }
    }
    
    func fetchUser()async {
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        guard let snaphot = try? await Firestore.firestore().collection("LoginPersons").document(uid).getDocument() else{
            return
        }
        self.currentUser = try? snaphot.data(as:UserModel.self)
    }
    
    // MARK: - SENDING MESSAGE
    
    func sendMessage(text: String, completion: @escaping (Bool) -> Void) {
        guard let user = currentUser else {
            completion(false) // Kullanıcı yoksa gönderme işlemi başarısız
            return
        }
        
        let msg = Message(userUid: user.id, userName: user.fullName, text: text, photoURL: user.photoURL, createdAt: Date())
        MessageDataBaseManagerPractice.shared.sendMessageToDatabase(message: msg, currentUser: user) { success in
            // Gönderme işlemi başarılı olduysa completion bloğunu çağır
            completion(success)
        }
    }
    
    
    // MARK: - MESSAGE CHECK
    
    func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    
    

    
    func isFromCurrentUser(message: Message) -> Bool {
        guard let currUser = currentUser else {
            return false
        }

        return currUser.id == message.userUid
    }
    
    
    
    func CurrentUserValid()-> Bool{
        if (currentUser == nil){
            return false
        }else{
            return true
        }
        
    }
}
