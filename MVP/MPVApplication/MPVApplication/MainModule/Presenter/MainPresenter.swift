//
//  MainPresenter.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 30.07.2021.
//

import UIKit

// MARK: - Protocols

// MARK: MainViewProtocol
protocol MainViewProtocol: AnyObject {
    func success()
    func failure()
}

// MARK: MainViewPresenter
protocol MainViewPresenterProtocol {
    var posts: [Post]? { get set }
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getPosts()
}

// MARK: - Class
class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var networkService: NetworkServiceProtocol
    
    var posts: [Post]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        
        getPosts()
    }
    
    func getPosts() {
        networkService.getPosts { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.posts = posts
                    self.view?.success()
                case .failure:
                    self.view?.failure()
                }
            }
        }
    }
}
