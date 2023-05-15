//
//  NetworkManager.swift
//  HarryPotter-JSON
//
//  Created by Zaki on 10.05.2023.
//

import Foundation
import Alamofire

enum Link {
    case characterURL
    
    var url: URL {
        switch self {
        case .characterURL:
            return URL(string: "https://hp-api.onrender.com/api/characters")!
        }
    }
}


final class NetworkManager {

    static let shared = NetworkManager()
    private init() {}
    
    func fetchCharacters(from url: URL, completion: @escaping (Result<[Character], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let characters = Character.getCharacters(from: value)
                    completion(.success(characters))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchData(from url: URL, completion: @escaping (Result<Data, AFError>) -> Void ) {
        AF.request(url)
            .validate()
            .responseData { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

}
