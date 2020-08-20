//
//  MyTableViewCell.swift
//  testAlamofire
//
//  Created by Cem Kazım on 20.08.2020.
//  Copyright © 2020 Cem Kazım. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myTableViewCellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
