//
//  LoginViewModel.swift
//  Jobiz
//
//  Created by Developer on 24.06.24.
//

//import Foundation
////import FirebaseAuth
//
//class LoginViewModel {
//    var email: String = ""
//    var password: String = ""
//
//    var isLoginButtonEnabled: Bool {
//        return !email.isEmpty && !password.isEmpty
//    }
//
//    func login(completion: @escaping (Result<User, Error>) -> Void) {
//        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//            if let error = error {
//                completion(.failure(error))
//            } else if let user = authResult?.user {
//                completion(.success(user))
//            }
//        }
//    }
//
//    func googleLogin(presentingViewController: UIViewController, completion: @escaping (Result<User, Error>) -> Void) {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//        let signInConfig = GIDConfiguration(clientID: clientID)
//        
//        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: presentingViewController) { user, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let authentication = user?.authentication, let idToken = authentication.idToken else {
//                completion(.failure(NSError(domain: "Google Sign-In Error", code: -1, userInfo: nil)))
//                return
//            }
//
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
//            
//            Auth.auth().signIn(with: credential) { authResult, error in
//                if let error = error {
//                    completion(.failure(error))
//                } else if let user = authResult?.user {
//                    completion(.success(user))
//                }
//            }
//        }
//    }
//}
//
