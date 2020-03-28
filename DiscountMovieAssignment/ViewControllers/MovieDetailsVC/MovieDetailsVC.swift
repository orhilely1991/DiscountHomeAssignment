//
//  MovieDetailsVC.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 27/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class MovieDetailsVC: BaseVC ,UITableViewDelegate, UITableViewDataSource {

    weak var movieDetails : Results?
    
    var movieVideos : [ResultsVideos] = []
    
    @IBOutlet weak var tableViewMovieDetails: UITableView!{
        didSet{
            AppUtils.registerCellToTable("MovieTitleTableCell", tableView: self.tableViewMovieDetails)
            AppUtils.registerCellToTable("MovieOverviewTableCell", tableView: self.tableViewMovieDetails)
            AppUtils.registerCellToTable("MovieDateTableCell", tableView: self.tableViewMovieDetails)
            AppUtils.registerCellToTable("MoviePosterImageTableCell", tableView: self.tableViewMovieDetails)
            AppUtils.registerCellToTable("MovieTrailerCell", tableView: self.tableViewMovieDetails)
        }
    }
    
    init(movieDetails : Results) {
        super.init(nibName: "MovieDetailsVC", bundle: nil)
        
        self.movieDetails = movieDetails
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.getMovieVideos()
    }
    
    func getMovieVideos()
    {
        if let movieId = self.movieDetails?.id
        {
            self.showProgress(view: self.view)
            
            WebServices.sharedInstance.getMovieVideos(movieId: movieId, { [weak self](GetMovieVideosResponse) in
                
                guard let self = self else{return}
                
                self.hideProgress()
                if let movieVideos = GetMovieVideosResponse.results
                {
                    self.movieVideos = movieVideos.filter({ $0.site == "YouTube"})
                }
                
                self.tableViewMovieDetails.reloadData()
                
            }) { (ErrorResponse) in
                
                self.hideProgress()
                
                if let errorMessage = ErrorResponse.status_message{
                    
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
                
                self.tableViewMovieDetails.reloadData()
            }
        }
    }
    
    // MARK: UITableView delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows = self.movieVideos.count == 0 ? AppConstants.MovieDetailsCells.trailer.rawValue : AppConstants.MovieDetailsCells.trailer.rawValue + self.movieVideos.count
        return  numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case AppConstants.MovieDetailsCells.title.rawValue:
            let cell : MovieTitleTableCell = tableView.dequeueReusableCell(withIdentifier: "MovieTitleTableCell", for: indexPath) as! MovieTitleTableCell
            
            cell.lblTitle.text = self.movieDetails?.title
            return cell
        case AppConstants.MovieDetailsCells.overview.rawValue:
            let cell : MovieOverviewTableCell = tableView.dequeueReusableCell(withIdentifier: "MovieOverviewTableCell", for: indexPath) as! MovieOverviewTableCell
            
            cell.lblOverview.text = self.movieDetails?.overview
            return cell
        case AppConstants.MovieDetailsCells.releaseDate.rawValue:
            let cell : MovieDateTableCell = tableView.dequeueReusableCell(withIdentifier: "MovieDateTableCell", for: indexPath) as! MovieDateTableCell
            
            if let releaseDate = self.movieDetails?.release_date
            {
                cell.lblDate.text = AppUtils.dateFormmater(oldDateString: releaseDate)
            }
            return cell
        case AppConstants.MovieDetailsCells.poster.rawValue:
            let cell : MoviePosterImageTableCell = tableView.dequeueReusableCell(withIdentifier: "MoviePosterImageTableCell", for: indexPath) as! MoviePosterImageTableCell
            
            if let posterPath = self.movieDetails?.poster_path
            {
                cell.imageViewPoster.sd_setImage(with: URL(string: RequestBuilder.ServicePath.BaseImage + posterPath
                )) { (image, error, type, url) in
                    cell.imageViewPoster.image = image
                }
            }
            return cell
            
        default:

            let cell : MovieTrailerCell = tableView.dequeueReusableCell(withIdentifier: "MovieTrailerCell", for: indexPath) as! MovieTrailerCell
            
            cell.lblTrailerName.text = self.movieVideos[indexPath.row - AppConstants.MovieDetailsCells.trailer.rawValue].name ?? ""
            
            let movieVideo = self.movieVideos[indexPath.row - AppConstants.MovieDetailsCells.trailer.rawValue]
            
            let imageUrl = AppConstants.youtubePrefix + movieVideo.key! + "/hqdefault.jpg"
            cell.imageViewTrailer.sd_setImage(with: URL(string: imageUrl)) { (image, error, type, url) in
                cell.imageViewTrailer.image = image
            }
            
            cell.btnPlay.tag = indexPath.row
            
            cell.btnPlay.addTarget(self, action: #selector(self.didClickPlay), for: .touchUpInside)
            return cell
            
        }
    }
    
    @objc func didClickPlay(sender : UIButton) {
        
        let movieVideo = self.movieVideos[sender.tag - AppConstants.MovieDetailsCells.trailer.rawValue]

        let movieVideoVC : MovieVideoVC = MovieVideoVC(trailerId: movieVideo.key!)
        self.present(movieVideoVC, animated: true, completion: nil)
        
    }
}
