//
//  MovieTableCell.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 27/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

class MovieTableCell: UITableViewCell {

    @IBOutlet weak var lblTitle: AppRegularLabel!
    @IBOutlet weak var imgMovie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
