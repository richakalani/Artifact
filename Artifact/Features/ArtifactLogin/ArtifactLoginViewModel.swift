//
//  ArtifactLoginViewModel.swift
//  Artifact
//
//  Created by Richa Kalani on 20/05/26.
//

import Foundation
import FirebaseAuth

@Observable
class ArtifactLoginViewModel {

    var isSignedIn: Bool = false
    var errorMessage: String = ""
    var email: String = ""
    var isLogIn: Bool = false
    var isEmailPasswordEmpty: Bool = false
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                DispatchQueue.main.async {
                    if let error {
                        self?.errorMessage = error.localizedDescription
                    } else {
                        self?.isSignedIn = true
                    }
                }
            }
    }
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if let error {
                    self?.errorMessage = error.localizedDescription
                } else {
                    self?.isSignedIn = true
                }
            }
        }
    }
}
