//
//  StringExtension.swift
//  KeychainSample
//
//  Created by Ebubekir Sezer on 14.09.2023.
//

import Foundation

extension String {
    static func append(strings: String?...) -> String {
        return strings.compactMap({$0}).joined()
    }
}
