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
    func getUserPost(userId: Int)
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
    
    func getUserPost(userId: Int) {
        ServiceManager<Service>().request(target: .getUserPosts(userId: userId), model: [UserPosts].self) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    
}
