//
//  Model.swift
//  MVVMApplication
//
//  Created by Дмитрий Юдин on 02.08.2021.
//

import Foundation

enum MainScreenState {
    case initial
    case loading
    case success([TodoData])
    case failure
}
