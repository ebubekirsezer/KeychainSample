//
//  LoginViewModel.swift
//  KeychainSample
//
//  Created by Ebubekir Sezer on 14.09.2023.
//

import SwiftUI

extension LoginView {
    class ViewModel: ObservableObject {
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var isUserLogged: Bool = false
        @Published var loggedUserMail: String = ""
        @Published var loggedPassword: String = ""
        
        func onAppear() {
            if let credentials = KeychainManager.shared.credentials(),
               let range = credentials.range(of: "=") {
                loggedUserMail = String(credentials[..<range.lowerBound])
                loggedPassword = String(credentials[range.upperBound...])
                isUserLogged = true
            }
        }
        
        func login() {
            if !email.isEmpty {
                let all = String.append(strings: email, "=", password)
                KeychainManager.shared.setCredentials(all)
            }
        }
    }
}
