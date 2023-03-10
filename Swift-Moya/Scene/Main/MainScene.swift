//
//  MainScene.swift
//  Swift-Moya
//
//  Created by emre usul on 11.02.2023.
//

import UIKit

protocol MainSceneInterface {
    func configureTableView()
    func reloadUI()
}


class MainScene: UIViewController {
    
    private let viewModel = MainSceneViewModel()
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
        
    }
}

extension MainScene: MainSceneInterface {
    
    func configureTableView() {
        navigationController?.navigationBar.topItem?.title = "Select User"
        
        tableView = UITableView()
        tableView.register(UINib(nibName: "MainCell", bundle: nil),
                           forCellReuseIdentifier: MainCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        view.addSubview(tableView)
    }
    
    func reloadUI() {
        tableView.reloadMainThread()
    }
    
}

extension MainScene: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as! MainCell
        cell.configureCell(model: viewModel.users[indexPath.row], photo: viewModel.photo[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.users[indexPath.row]
        let photo = viewModel.photo[indexPath.row]
        navigationController?.pushViewController(UserPostScene(model: model,
                                                               user: indexPath.row,
                                                               photo: photo), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
