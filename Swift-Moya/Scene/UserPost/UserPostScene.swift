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
    func reloadUI()
}

class UserPostScene: UIViewController {
    
    private var photoName: String?
    
    init(model: User, user: Int ,photo:String) {
        super.init(nibName: nil, bundle: nil)
        self.model = model
        self.photoName = photo
        viewModel.getUserPost(userId: user+1)
       
    }
    

   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    private let viewModel = UserPostSceneViewModel()
    private var model:User?
    
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var backgroundView: UIImageView!
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
        backgroundView = UIImageView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.image = UIImage(named: "windows")
        
        profileImage = UIImageView()
        guard let photo = photoName else { return }
        profileImage.image = UIImage(named: photo)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        profileView = ProfileView()
        profileView.nameLabel.text = model?.name
        profileView.emailLabel.text = model?.email
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
        tableView.isScrollEnabled = false
        tableView.sizeToFit()
            
        contentView.addSubview(tableView)
        
        
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
            
            tableView.heightAnchor.constraint(equalToConstant: 1950)
            
        ])
    }
    func reloadUI() {
        tableView.reloadMainThread()
    }
        
}

extension UserPostScene: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserPostCell.identifier, for: indexPath) as! UserPostCell
        let post = viewModel.posts[indexPath.row]
        cell.configure(post: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.posts[indexPath.row]
        let title = Title(title: model.title, body: model.body)
        navigationController?.pushViewController(CommentScene(model: title), animated: true)
    }



}
