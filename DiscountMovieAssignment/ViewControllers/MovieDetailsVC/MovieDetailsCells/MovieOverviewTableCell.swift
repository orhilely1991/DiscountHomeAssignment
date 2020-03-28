//
//  MovieOverviewTableCell.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 28/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

class MovieOverviewTableCell: UITableViewCell {

    @IBOutlet weak var lblOverview: AppRegularLabel!{
        didSet{
            //self.lblOverview.adjustsFontSizeToFitWidth = false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
