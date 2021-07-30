//
//  NetworkService.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 30.07.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPosts(completion: @escaping (Result<[Post], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(.success(posts))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
