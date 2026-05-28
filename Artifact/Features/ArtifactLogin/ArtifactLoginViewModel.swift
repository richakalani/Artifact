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
    var isGuest: Bool = false
    private var authListener: AuthStateDidChangeListenerHandle?
    
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
    func startListening() {
        authListener = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.isSignedIn = user != nil
            }
        }
    }
    func stopListening() {
        if let handle = authListener {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
