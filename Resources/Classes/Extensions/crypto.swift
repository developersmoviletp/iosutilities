//
//  crypto.swift
//
//  Created by Juan Reynaldo Escobar Miron on 11/05/18.
//

import UIKit
import CryptoSwift


extension String {
    func aesEncrypt(value : String, key: String, iv: String) throws -> String {
        let res = key.bytes[0...15]
        let res2 : [UInt8] = Array(res)
        
        let data = value.data(using: .utf8)!
        let encrypted = try! AES(key: res2, blockMode: .CBC(iv: res2), padding: .pkcs7).encrypt([UInt8](data))
        let encryptedData = Data(encrypted)
        return encryptedData.base64EncodedString()
    }
    
    func aesDecrypt(value : String, key: String, iv: String) throws -> String {
        let data = Data(base64Encoded: value)!
        let decrypted = try! AES(key: key.bytes, blockMode: .CBC(iv: iv.bytes), padding: .pkcs7).decrypt([UInt8](data))
        let decryptedData = Data(decrypted)
        return String(bytes: decryptedData.bytes, encoding: .utf8) ?? "Could not decrypt"
    }
    
    func crypt() -> String {
        do {
            return try aesEncrypt(value: self, key: "eJG7R3O/Z+8a/FzQb4X7zv5Um++9tHo=!", iv: "eJG7R3O/Z+8a/FzQb4X7zv5Um++9tHo=!")
        } catch {
            print(error)
        }
        return self
    }
}
