//
//  LoginData.swift
//  SimpleLoginApp
//
//  Created by Sravya Kaki on 12/24/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import Foundation

struct LoginData: Decodable {
    
    var isSuccessful: Bool
    var username: String
    
    enum CodingKeys: String, CodingKey {
        case isSuccessful
        case username
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        isSuccessful = try container.decode(Bool.self, forKey: .isSuccessful)
        username = try container.decode(String.self, forKey: .username)
    }
}
