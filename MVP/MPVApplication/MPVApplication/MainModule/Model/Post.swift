//
//  Comment.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 30.07.2021.
//

import Foundation

// {
//    "userId": 1,
//    "id": 1,
//    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
// }

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
