//
//  UIView+Ext.swift
//  Swift-Moya
//
//  Created by emre usul on 11.02.2023.
//

import UIKit

extension UITableView {
    
    func reloadMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
