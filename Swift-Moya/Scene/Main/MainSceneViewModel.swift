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
    weak var view: MainSceneInterface?
}

extension MainSceneViewModel: MainSceneViewModelInterface {
    func viewDidLoad() {
        
    }
    
}
