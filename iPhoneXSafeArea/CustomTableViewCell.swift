//
//  CustomTableViewCell.swift
//  iPhoneXSafeArea
//
//  Created by Justin Stanley on 2017-09-17.
//  Copyright © 2017 Justin Stanley. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var label: UILabel!
    static let nibName = "CustomTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = 5
    }
    
    func update(text: String, image: UIImage) {
        self.iconView.image = image
        self.label.text = text
    }
}
