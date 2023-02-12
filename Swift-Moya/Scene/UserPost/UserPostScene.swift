//
//  UserPostScene.swift
//  Swift-Moya
//
//  Created by emre usul on 13.02.2023.
//

import UIKit

protocol UserPostSceneInterface: AnyObject {
    func configureScrollView()
}

class UserPostScene: UIViewController {
    
    private let viewModel = UserPostSceneViewModel()
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
}

extension UserPostScene: UserPostSceneInterface {
    func configureScrollView() {
        view.backgroundColor = UIColor.red
     
    }
    

    
}
