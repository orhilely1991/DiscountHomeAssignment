//
//  MovieTrailerCell.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 28/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

class MovieTrailerCell: UITableViewCell {

    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var lblTrailerName: AppRegularLabel!
    @IBOutlet weak var imageViewTrailer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
