//
//  ProfileView.swift
//  Swift-Moya
//
//  Created by emre usul on 13.02.2023.
//

import UIKit

class ProfileView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewInit() {
        let xibView = Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
    
   
  
    public func configureView(name: String, email: String) {
        nameLabel.text = name
        emailLabel.text = email
    }

}
