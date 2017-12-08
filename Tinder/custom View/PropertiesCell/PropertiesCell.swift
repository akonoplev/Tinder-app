//
//  PropertiesCell.swift
//  Tinder
//
//  Created by Андрей Коноплев on 08.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import UIKit

class PropertiesCell: UITableViewCell {

    @IBOutlet weak var property: UILabel!
    
    weak var viewModel: PropertiesViewModel! {
        didSet {
            self.property.text = viewModel.property
        }
    }
    
    
}
