//
//  AppUtils.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 26/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

class AppUtils: NSObject {
    
    class func registerCellToCollectionView(_ cellName : String,collectionView : UICollectionView) {
        
        let nibName = UINib(nibName: cellName, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: cellName)
    }
    class func registerCellToTable(_ cellName : String,tableView : UITableView) {
        
        let nibName = UINib(nibName: cellName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: cellName)
    }
    class func getGenreColor(genreId : Int) -> UIColor
    {
        return AppConstants.genresColors[genreId % AppConstants.genresColors.count]
    }
    
    class func dateFormmater(oldDateString : String) -> String
    {
        let dateFormmater  = DateFormatter()
        dateFormmater.dateFormat = "yyyy-MM-dd"
        if let oldDate  = dateFormmater.date(from: oldDateString){
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "dd MMM yy"
            newDateFormatter.timeZone = NSTimeZone.local
            return newDateFormatter.string(from: oldDate)
        }
        
        return oldDateString
    }
    class func setEqualConstraints(newView : UIView , exsitView : UIView){
        newView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: exsitView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: exsitView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: exsitView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: exsitView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0).isActive = true
    }
}
