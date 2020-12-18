//
//  Extensions.swift
//  CurrencyConverter
//
//  Created by Azza on 12/18/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import UIKit
import Foundation

extension UIView{
    
    // corner radius
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    // shadow
    @IBInspectable
    var shadowColor: UIColor {
        get {
            return self.shadowColor
        }
        set {
            self.layer.shadowColor = newValue.cgColor
            self.layer.shadowOffset = CGSize.zero
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 4
            self.layer.masksToBounds = false
        }
    }
}

extension UITableView{
    func animate() {
        self.reloadData()
        let cells = self.visibleCells
        let tableHeight: CGFloat = self.bounds.size.height
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        var index = 0
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1, delay:  0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
}

