//
//  AppRegularLabel.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 28/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

class AppRegularLabel: UILabel {
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
        
        self.font = UIFont(name: "ChalkboardSE-Regular" , size: (self.font.pointSize))
        self.adjustsFontSizeToFitWidth = true
        
    }
    
}
