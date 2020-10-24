//
//  BreedPageResDTO.swift
//  TestCo
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

struct CommentsPageResDTO: Codable {
    var currentPage: Int
    var comments: [CommentaryResDTO]
    var total: Int
    var prev: String?
    var next: String?

    private enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case comments = "data"
        case total
        case prev
        case next
    }
}
