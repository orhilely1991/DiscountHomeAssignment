//
//  MovieVideoVC.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 28/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class MovieVideoVC: UIViewController , WKYTPlayerViewDelegate {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var playerView: WKYTPlayerView!
    var movieId : String?
    
    init (trailerId : String)
    {
        super.init(nibName: "MovieVideoVC", bundle: nil)
        self.movieId = trailerId
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.activity.startAnimating()
        
        self.playerView.delegate = self
        self.playerView.load(withVideoId: movieId!)
    }
    
    // MARK: WKYTPlayerViewDelegate
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        
        self.activity.stopAnimating()
        self.activity.isHidden = true
        playerView.playVideo()
    }
}
