//
//  NetworkService.swift
//  MVVMApplication
//
//  Created by Дмитрий Юдин on 02.08.2021.
//

import Foundation

protocol NetworkProtocol: AnyObject {
    func getTodos(completion: @escaping (Result<[TodoData], Error>) -> Void)
}

class NetworkService: NetworkProtocol {
    func getTodos(completion: @escaping (Result<[TodoData], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/todos"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let todos = try JSONDecoder().decode([TodoData].self, from: data)
                completion(.success(todos))
            } catch let dataError {
                fatalError(dataError.localizedDescription)
            }
            
        }.resume()
    }
}
