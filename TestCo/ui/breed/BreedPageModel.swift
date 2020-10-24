//
//  BreedPageModel.swift
//  TestCo
//
//  Created by Laddy Diaz Lamus on 24/10/20.
//

import Foundation

struct BreedPageModel: Codable, Equatable {
    var currentPage: Int
    var comments: [BreedModel]
    var total: Int
    var next: String?
    
    
    init(currentPage: Int,
         comments: [BreedModel],
         total: Int,
         next: String?) {
        self.currentPage = currentPage
        self.comments = comments
        self.total = total
        self.next = next
    }
    
    init() {
        self.currentPage = 0
        self.comments = []
        self.total = 0
        self.next = nil
    }
    
    mutating func set(currentPage: Int,
                      comments: [BreedModel],
                      total: Int,
                      next: String?)  {
        self.currentPage = currentPage
        self.comments.append(contentsOf: comments)
        self.total = total
        self.next = next
    }
    
    static func toModel(dto: CommentsPageResDTO) -> CommentsPageModel {
        let model = CommentsPageModel(currentPage: dto.currentPage,
                                      comments: CommentModel.toModels(dto: dto.comments),
                                      total: dto.total,
                                      next: dto.next)
        return model
    }
}
