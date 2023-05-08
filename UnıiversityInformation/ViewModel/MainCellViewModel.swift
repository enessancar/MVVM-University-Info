//
//  MainCellViewModel.swift
//  UnıiversityInformation
//
//  Created by Enes Sancar on 8.05.2023.
//

import Foundation

struct MainCellViewModel {
    private let model: University
    
    init(model: University) {
        self.model = model
    }
    
    var url: URL? {
        return URL(string: model.webPages.first ?? "https://www.google.com")
    }
    
    var name: String? {
        return model.name
    }
}
