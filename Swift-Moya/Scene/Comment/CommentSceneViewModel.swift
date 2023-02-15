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
}


final class CommentSceneViewModel {
   weak var view: CommentSceneInterface?
}

extension CommentSceneViewModel: CommentSceneViewModelInterface {
    
    func viewDidLoad() {
        view?.configureUI()
        view?.configureTableView()
    }
    
    
}
