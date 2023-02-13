//
//  UserPostSceneViewModel.swift
//  Swift-Moya
//
//  Created by emre usul on 13.02.2023.
//

import Foundation


protocol UserPostSceneViewModelInterface {
    var view: UserPostSceneInterface? { get set }
    func viewDidLoad()
}


final class UserPostSceneViewModel {
    weak var view: UserPostSceneInterface?
    var user:User?
}

extension UserPostSceneViewModel: UserPostSceneViewModelInterface {
    func viewDidLoad() {
        view?.configureScroll()
        view?.configureUI()
        view?.configureTableView()
    }
    
    
}
