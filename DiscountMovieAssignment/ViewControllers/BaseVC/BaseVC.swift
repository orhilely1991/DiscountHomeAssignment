//
//  BaseVC.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 28/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit
import Lottie

class BaseVC: UIViewController {

    let animationView = AnimationView(name: "movie")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func showProgress(view : UIView)
    {
        self.animationView.center = view.center
        self.animationView.contentMode = .center
        view.addSubview(self.animationView)
        AppUtils.setEqualConstraints(newView: self.animationView, exsitView: view)
        self.animationView.play()
    }
    
    func hideProgress()
    {
        self.animationView.removeFromSuperview()
    }
}
