//
//  UserPostScene.swift
//  Swift-Moya
//
//  Created by emre usul on 13.02.2023.
//

import UIKit

protocol UserPostSceneInterface: AnyObject {
    func configureScroll()
    func configureUI()
    func configureTableView()
}

class UserPostScene: UIViewController {
    
//    init(model: User) {
//        self.model = model
//        super.init()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private let viewModel = UserPostSceneViewModel()
    private let model:User? = nil
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var backgroundView: UIView!
    private var profileImage: UIImageView!
    private var profileView: ProfileView!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
  
}

extension UserPostScene: UserPostSceneInterface {
   
    func configureScroll() {
        view.backgroundColor = UIColor.systemBackground
        scrollView = UIScrollView()
        contentView = UIView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
        ])
     
    }
    
    func configureUI() {
        backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor.red
        
        profileImage = UIImageView()
        profileImage.image = UIImage(named: "LeanneGraham")
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        profileView = ProfileView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(backgroundView)
        contentView.addSubview(profileImage)
        contentView.addSubview(profileView)
        
    
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            backgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 200),
            
            profileImage.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -50),
            profileImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 25),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            
            profileView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor),

        ])
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.register(UINib(nibName: "UserPostCell", bundle: nil),
                           forCellReuseIdentifier: UserPostCell.identifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        contentView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
        
}

extension UserPostScene: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserPostCell.identifier, for: indexPath) as! UserPostCell
        return cell
    }



}
