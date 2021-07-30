//
//  Builder.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 30.07.2021.
//

import UIKit

protocol BuilderProtocol {
    func createMainView() -> UIViewController
}

class Builder: BuilderProtocol {
    func createMainView() -> UIViewController {
        
        
        return UIViewController()
    }
    
    
}
