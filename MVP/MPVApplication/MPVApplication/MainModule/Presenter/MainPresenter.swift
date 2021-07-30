//
//  MainPresenter.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 30.07.2021.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func success()
    func failure()
}

protocol MainViewPresenterProtocol {
    var posts: [Post]? { get set }
    
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, posts: [Post]?)
    func getPosts()
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var networkService: NetworkServiceProtocol
    
    var posts: [Post]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, posts: [Post]?) {
        self.view = view
        self.networkService = networkService
    }
    
    func getPosts() {
        networkService.getPosts { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.posts = posts
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure()
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

