//
//  KeychainManager.swift
//  KeychainSample
//
//  Created by Ebubekir Sezer on 14.09.2023.
//

import Foundation

protocol KeychainManagerProtocol {
    @discardableResult func setCredentials(_ password: String, account: String) -> Bool
    func credentials(_ account: String) -> String?
}

final class KeychainManager: KeychainManagerProtocol {
    
    static let shared: KeychainManager = .init()

    @discardableResult
    func setCredentials(_ credential: String, account: String = "account") -> Bool {
        guard let data = credential.data(using: .utf8) else { return false }
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: account,
            kSecValueData as String: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    func credentials(_ account: String = "account") -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecAttrAccount as String: account ]
        
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            if let data = dataTypeRef as? Data {
                return String(data: data, encoding: .utf8)
            }
            return nil
        } else {
            return nil
        }
    }
}
