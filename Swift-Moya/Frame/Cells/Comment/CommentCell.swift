//
//  CommentCell.swift
//  Swift-Moya
//
//  Created by emre usul on 15.02.2023.
//

import UIKit

class CommentCell: UITableViewCell {
    
    static let identifier = "CommentCell"

    @IBOutlet private weak var bodyLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureCell(body: String, email: String) {
        bodyLabel.text = body
        emailLabel.text = email
    }
}
