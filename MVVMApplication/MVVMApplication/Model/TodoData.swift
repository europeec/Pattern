//
//  TodoData.swift
//  MVVMApplication
//
//  Created by Дмитрий Юдин on 02.08.2021.
//

import Foundation

/*
 {
     "userId": 1,
     "id": 1,
     "title": "delectus aut autem",
     "completed": false
   },
 */

struct TodoData: Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
