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
    
    init(model: User, user:Int) {
       self.model = model
       viewModel.getUserPost(userId: user)
       super.init(nibName: nil, bundle: nil)
    }
    

   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    private let viewModel = UserPostSceneViewModel()
    private var model:User?
    
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
        profileView.nameLabel.text = model?.name
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
           

        ])
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
      
        tableView.register(UINib(nibName: "UserPostCell", bundle: nil),
                           forCellReuseIdentifier: UserPostCell.identifier)

        tableView.delegate = self
        tableView.dataSource = self
            
        contentView.addSubview(tableView)
        
        let height = view.frame.height - 400
        
      NSLayoutConstraint.activate([
        
        profileView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor),
        profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        profileView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor),
        profileView.bottomAnchor.constraint(equalTo: tableView.topAnchor),
        profileView.heightAnchor.constraint(equalToConstant: 150),
        
        tableView.topAnchor.constraint(equalTo: profileView.bottomAnchor),
        tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
     
        tableView.heightAnchor.constraint(equalToConstant: height)
       
         
     ])
        
       
        
    }
        
}

extension UserPostScene: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserPostCell.identifier, for: indexPath) as! UserPostCell
        return cell
    }



}
