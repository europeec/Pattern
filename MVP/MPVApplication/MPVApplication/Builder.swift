//
//  Builder.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 30.07.2021.
//

import UIKit

protocol BuilderProtocol {
    func createMainView(router: RouterProtocol) -> UIViewController
    func createDetailView(post: Post?, router: RouterProtocol) -> UIViewController
}

class Builder: BuilderProtocol {
    
    func createMainView(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, router: router, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    func createDetailView(post: Post?, router: RouterProtocol) -> UIViewController {
        return MainViewController()
    }
}
