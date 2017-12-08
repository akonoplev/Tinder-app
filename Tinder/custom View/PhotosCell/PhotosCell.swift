//
//  PhotosCell.swift
//  Tinder
//
//  Created by Андрей Коноплев on 08.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import UIKit
import SDWebImage

class PhotosCell: UICollectionViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    
    weak var viewModel: PhotosCellViewModel! {
        didSet {
            photoImage.sd_setImage(with: URL(string: viewModel.photo_URL), completed: nil)
        }
    }
}
