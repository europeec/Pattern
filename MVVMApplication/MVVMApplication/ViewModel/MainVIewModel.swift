//
//  MainVIewModel.swift
//  MVVMApplication
//
//  Created by Дмитрий Юдин on 02.08.2021.
//

import UIKit

protocol MainViewModelProtocol: AnyObject {
    var updateData: (((MainScreenState) -> Void))? { get set }
    var networkService: NetworkService? { get set }
    func fetch()
}

class MainViewModel: MainViewModelProtocol {
    var updateData: (((MainScreenState) -> Void))?
    var networkService: NetworkService?
    
    init() {
        updateData?(.initial)
    }
    
    func fetch() {
        updateData?(.loading)
        networkService?.getTodos(completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.updateData?(.success(data))
            case .failure(_):
                self?.updateData?(.failure)
            }
        })
    }
    
}
