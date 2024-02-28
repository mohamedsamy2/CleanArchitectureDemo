//
//  NetworkManager.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import Alamofire

class AlamofireNetworkManager: NetworkManagerProtocol {
    static let shared = AlamofireNetworkManager()

    private init() {}

    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


class URLSessionNetworkManager: NetworkManagerProtocol {
    static let shared = URLSessionNetworkManager()

    private init() {}
    
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let emptyDataError = NSError(domain: "Domain", code: 0, userInfo: [NSLocalizedDescriptionKey: "Empty data"])
                completion(.failure(emptyDataError))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
