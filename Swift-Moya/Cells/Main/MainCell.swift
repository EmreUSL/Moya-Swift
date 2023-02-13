//
//  MainCell.swift
//  Swift-Moya
//
//  Created by emre usul on 11.02.2023.
//

import UIKit

class MainCell: UITableViewCell {
    
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    static let identifier = "MainCell"
    
    public func configureCell(model: User, photo: String) {
        nameLabel.text = model.name
        userNameLabel.text = "(\(model.username ?? ""))"
        emailLabel.text = model.email
        
        profilePhoto.image = UIImage(named: photo)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
