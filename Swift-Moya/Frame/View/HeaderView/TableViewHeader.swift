//
//  TableViewHeader.swift
//  Swift-Moya
//
//  Created by emre usul on 15.02.2023.
//

import UIKit

class TableViewHeader: UITableViewHeaderFooterView {
    
    let headerView = CommentView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        contentView.backgroundColor = UIColor.gray
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            headerView.heightAnchor.constraint(equalToConstant: 223),
        ])
    }
    

}
