//
//  DetailPresenter.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 02.08.2021.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    func setPost(post: Post?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, router: RouterProtocol, post: Post?)
    func setComment()
    func pop()
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    
    var post: Post?
    required init(view: DetailViewProtocol, router: RouterProtocol, post: Post?) {
        self.view = view
        self.router = router
        self.post = post
    }
    
    func setComment() {
        self.view?.setPost(post: post)
    }
    
    func pop() {
        router?.popToRoot()
    }
}
