//
//  PostCommentScene.swift
//  Swift-Moya
//
//  Created by emre usul on 15.02.2023.
//

import UIKit


protocol CommentSceneInterface: AnyObject {
    func configureScroll()
    func configureTableView()
    func reloadUI()
}


class CommentScene: UIViewController {
    
    init(model: Title, postId: Int) {
        super.init(nibName: nil, bundle: nil)
        self.model = model
        viewModel.getPostComment(postId: postId+1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewModel = CommentSceneViewModel()
    private var tableView: UITableView!
    private var model = Title()
    private var scrollView: UIScrollView!
    private var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension CommentScene: CommentSceneInterface {
    
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
    
    func configureTableView() {
        tableView = UITableView()
        tableView.register(TableViewHeader.self,
                           forHeaderFooterViewReuseIdentifier: "sectionHeader")
        tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: CommentCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 9000)
        ])
    }
    
    func reloadUI() {
        tableView.reloadMainThread()
    }
}

extension CommentScene: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.identifier, for: indexPath) as! CommentCell
        let body = viewModel.comment[indexPath.row].body
        let email = viewModel.comment[indexPath.row].email
        cell.configureCell(body: body ?? "", email: email ?? "")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! TableViewHeader
        view.headerView.configureView(title: model.title!, body: model.body!)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 223
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
}
