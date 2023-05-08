//
//  ServiceConstant.swift
//  UnıiversityInformation
//
//  Created by Enes Sancar on 8.05.2023.
//

import Foundation

class ServiceConstant {
    
    static let shared = ServiceConstant()
    private init() {}
    
    public var url: String {
        get {
            return "http://universities.hipolabs.com/search?country=turkey"
        }
    }
}
