

import SwiftUI
import FirebaseCore

/* NOTLARIM

 1- Eğer bir textfieldı kendin özelleştirmek istiyorusn diyelim bunu kalıcı yapabilirsin  textField ailesi içine dahil edebilirsin. Design code rive animation videsou custom textfield kısmını izlersen öğrenirsin bir kaç kez kendin yap bunu.
 
 */

@main
struct AkeAppTry1App: App {
    @StateObject var akeLoginViewModel = AkeLoginViewModel()
    @StateObject var personViewModel = MockPersonViewModel()
    @StateObject var practiceViewModel = PersonViewModel()
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
           LandingPage()
                .environmentObject(akeLoginViewModel)
                .environmentObject(personViewModel)
                .environmentObject(practiceViewModel)
           
                
        }
        
    }
}


