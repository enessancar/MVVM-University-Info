//
//  University.swift
//  UnıiversityInformation
//
//  Created by Enes Sancar on 8.05.2023.
//

import Foundation

struct University: Decodable {
    
    let webPages: [String]
    let country: String
    let domains: [String]
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case webPages = "web_pages"
        case country, domains, name
    }
}
