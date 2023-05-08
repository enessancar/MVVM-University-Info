//
//  MainViewModel.swift
//  UnıiversityInformation
//
//  Created by Enes Sancar on 8.05.2023.
//

import Foundation

class MainViewModel {
    
    var dataResult: [University] = []
   
    func getData(completion: @escaping([University]?) -> Void) {
        Service.getData { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let dataResult):
                self.dataResult = dataResult
                completion(self.dataResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        dataResult.count
    }
    
    func createMainCellViewModel(model: University) -> MainCellViewModel {
        let cellModel = MainCellViewModel(model: model)
        return cellModel
    }
}
