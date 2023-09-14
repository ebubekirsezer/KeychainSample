//
//  FastLoginView.swift
//  KeychainSample
//
//  Created by Ebubekir Sezer on 14.09.2023.
//

import SwiftUI

struct FastLoginView: View {
    @Binding var email: String
    
    var body: some View {
        VStack(spacing: 32) {
            Label(email, systemImage: "user")
            Button("Fast Login") { }
        }
    }
}
