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
    
//    func fetchImage(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: url) else {
//                completion(.failure(.noData))
//                return
//            }
//            DispatchQueue.main.async {
//                completion(.success(imageData))
//            }
//        }
//    }
//
//    func fetchCharacters(from url: URL, completion: @escaping (Result <[Character], NetworkError>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data else {
//                completion(.failure(.noData))
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let dataModel = try decoder.decode([Character].self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(dataModel))
//                }
//            } catch {
//                completion(.failure(.decodingError))
//            }
//        }.resume()
//    }
    
    
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
