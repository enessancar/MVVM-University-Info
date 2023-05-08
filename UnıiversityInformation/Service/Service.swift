//
//  Service.swift
//  UnıiversityInformation
//
//  Created by Enes Sancar on 8.05.2023.
//

import Foundation
import Alamofire

enum ServiceError: Error {
    case urlError
    case decodingError
}

class Service {
    
    static func getData(completion: @escaping(Result<[University], ServiceError>) -> Void) {
        AF.request(ServiceConstant.shared.url).response { response in
            if response.error != nil {
                completion(.failure(.urlError))
                return
            }
            guard let data = response.data else {
                return
            }
            do {
                let dataResult = try JSONDecoder().decode([University].self, from: data)
                completion(.success(dataResult))
            } catch {
                completion(.failure(.decodingError))
            }
        }
    }
}
