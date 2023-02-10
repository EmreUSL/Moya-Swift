//
//  MainScene.swift
//  Swift-Moya
//
//  Created by emre usul on 11.02.2023.
//

import UIKit

protocol MainSceneInterface: AnyObject {
    
}


class MainScene: UIViewController {
    
    private let viewModel = MainSceneViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewDidLoad()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceManager.shared.getUser()
    }

}

extension MainScene: MainSceneInterface {
    
}
