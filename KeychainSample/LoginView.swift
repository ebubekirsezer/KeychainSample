//
//  ContentView.swift
//  KeychainSample
//
//  Created by Ebubekir Sezer on 12.09.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: ViewModel = .init()
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Email", text: $viewModel.email)
                .padding()
                .textInputAutocapitalization(.never)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                }
            SecureField("Password", text: $viewModel.password)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                }
            
            Button("Login", action: viewModel.login)
        }
        .padding()
        .onAppear(perform: viewModel.onAppear)
        .sheet(isPresented: $viewModel.isUserLogged) {
            FastLoginView(email: $viewModel.loggedUserMail)
                .padding()
                .presentationDetents([.height(250)])
                .presentationCornerRadius(20)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
