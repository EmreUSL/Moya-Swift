//
//  UserPostCell.swift
//  Swift-Moya
//
//  Created by emre usul on 13.02.2023.
//

import UIKit

class UserPostCell: UITableViewCell {
    
    static let identifier = "UserPostCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(post: Post) {
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }
    
}
