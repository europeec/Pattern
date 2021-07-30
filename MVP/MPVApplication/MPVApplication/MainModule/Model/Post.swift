//
//  Comment.swift
//  MPVApplication
//
//  Created by Дмитрий Юдин on 30.07.2021.
//

import Foundation

//{
//    "postId": 2,
//    "id": 6,
//    "name": "et fugit eligendi deleniti quidem qui sint nihil autem",
//    "email": "Presley.Mueller@myrl.com",
//    "body": "doloribus at sed quis culpa deserunt consectetur qui praesentium\naccusamus fugiat dicta\nvoluptatem rerum ut voluptate autem\nvoluptatem repellendus aspernatur dolorem in"
//  }

struct Post: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
