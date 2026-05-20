//
//  ContentView.swift
//  Artifact
//
//  Created by Richa Kalani on 20/05/26.
//

import SwiftUI
import CoreData

struct ArtifactLoginView: View {
    @Binding var isOnboarded: Bool
    @State private var viewModel = ArtifactLoginViewModel()
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing: 10) {
                    Image(systemName: "newspaper.fill")
                        .font(.system(size: 64))
                        .foregroundStyle(.white)
                        .padding(.bottom, 14)
                    Text("Artifact")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.white)
                    Text("The best stories from the sources you love, just for you!")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    VStack(spacing: 12) {
                        TextField("Email", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled(true)
                            .textFieldStyle(.roundedBorder)
                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .font(.caption)
                                .foregroundStyle(.red)
                        }
                        Button(viewModel.isLogIn ? "Sign in" : "Create account") {
                            if viewModel.email.isEmpty || password.isEmpty {
                                viewModel.isEmailPasswordEmpty = true
                            }  else {
                                viewModel.isLogIn ? viewModel.signIn(email: viewModel.email, password: password) : viewModel.signUp(email: viewModel.email, password: password)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .navigationDestination(isPresented: $viewModel.isSignedIn) {
                            ArtifactTopicPickerView()
                        }
                        if viewModel.isEmailPasswordEmpty {
                            Text("Enter email id and password to continue")
                                .font(.caption)
                                .foregroundStyle(.red)
                        }
                        Button(viewModel.isLogIn ? "No account? Sign Up" : "Have an account? Sign up") {
                            viewModel.isLogIn.toggle()
                        }
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        Button("Continue as Guest") {
                            // navigate to main screen
                        }
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                }
            }
        }
        .onChange(of: viewModel.isSignedIn) { _, isSignedIn in
            if isSignedIn {
                isOnboarded = true
            }
        }
    }
}

