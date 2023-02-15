//
//  CommentView.swift
//  Swift-Moya
//
//  Created by emre usul on 15.02.2023.
//

import UIKit

class CommentView: UIView {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func viewInit() {
        let xibView = Bundle.main.loadNibNamed("CommentView", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
    
    public func configureView(title: String, body: String) {
        titleLabel.text = title
        bodyLabel.text = body
    }
    
    
}
