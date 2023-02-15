//
//  PostCommentSceneViewModel.swift
//  Swift-Moya
//
//  Created by emre usul on 15.02.2023.
//

import Foundation

protocol CommentSceneViewModelInterface {
    var view: CommentSceneInterface? { get set }
    func viewDidLoad()
    func getPostComment(postId: Int)
}


final class CommentSceneViewModel {
   weak var view: CommentSceneInterface?
    var comment: [Comment] = []
}

extension CommentSceneViewModel: CommentSceneViewModelInterface {
  
    func viewDidLoad() {
        view?.configureScroll()
        view?.configureTableView()
    }
    
    func getPostComment(postId: Int) {
        ServiceManager<Service>().request(target: .getPostComments(postId: postId), model: [Comment].self) { result in
            switch result {
            case .success(let response):
                self.comment = response
                self.view?.reloadUI()
            case .failure(let error):
                print(error)
            }
        }
    }
}
