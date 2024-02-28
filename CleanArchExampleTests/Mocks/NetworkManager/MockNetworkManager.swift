//
//  MockNetworkManager.swift
//  CleanArchExampleTests
//
//  Created by Mohamed Samy on 31/01/2024.
//

@testable import CleanArchExample
import Foundation

class MockNetworkManager: NetworkManagerProtocol {
    var shouldFail = false
    var mockData: Data?
    var fetchedURL: URL?
    
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        fetchedURL = url
        
        if shouldFail {
            let error = NSError(domain: "MockErrorDomain", code: 123, userInfo: nil)
            completion(.failure(error))
        } else {
            guard let mockData = mockData else {
                // Handle the case where mock data is not set
                fatalError("Mock data is not set.")
            }

            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: mockData)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
