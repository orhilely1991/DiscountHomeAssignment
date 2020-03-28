//
//  GenresCollectionViewCell.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 26/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

class GenresCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundCellView: UIView!{
        didSet{
            self.backgroundCellView.layer.borderColor = UIColor.black.cgColor
            self.backgroundCellView.layer.borderWidth = 2.0
            self.backgroundCellView.layer.cornerRadius = 5.0
        }
    }
    @IBOutlet weak var lblTitle: AppRegularLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
