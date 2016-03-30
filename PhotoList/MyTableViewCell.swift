//
//  MyTableViewCell.swift
//  PhotoList
//
//  Created by JHJG on 2016. 3. 30..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var mImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
