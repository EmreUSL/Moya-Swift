//
//  MainSceneViewModel.swift
//  Swift-Moya
//
//  Created by emre usul on 11.02.2023.
//

import Foundation

protocol MainSceneViewModelInterface {
    var view: MainSceneInterface? { get set }
    func viewDidLoad()
 
}

final class MainSceneViewModel {
    var view: MainSceneInterface?
    var users:[User] = []
    let photo = UserProfile().profilePhoto
}

extension MainSceneViewModel: MainSceneViewModelInterface {
    
    func viewDidLoad() {
        view?.configureTableView()
        getUser()
    }
    
    private func getUser() {
        ServiceManager<Service>().request(target: .getUsers, model: [User].self) { result in
            switch result {
            case .success(let response):
                self.users = response
                self.view?.reloadUI()
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
