//
//  ExtensionColor.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 28/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

extension UIColor {
    class func RGBNew(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }

    class func customPinkColor() -> UIColor
    {
        return RGBNew(240, green: 122, blue: 241)
    }
    class func customRedColor() -> UIColor
    {
        return RGBNew(241, green: 122, blue: 122)
    }
    class func customOrangeColor() -> UIColor
    {
        return RGBNew(241, green: 171, blue: 122)
    }
    class func customYellowColor() -> UIColor
    {
        return RGBNew(241, green: 229, blue: 122)
    }
    class func customGreenColor() -> UIColor
    {
        return RGBNew(241, green: 241, blue: 122)
    }
    class func customLightBlueColor() -> UIColor
    {
        return RGBNew(122, green: 241, blue: 241)
    }
    class func customBlueColor() -> UIColor
    {
        return RGBNew(122, green: 176, blue: 241)
    }
}
