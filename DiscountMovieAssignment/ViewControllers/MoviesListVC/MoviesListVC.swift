//
//  MoviesListVC.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 27/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesListVC: BaseVC ,UITableViewDelegate, UITableViewDataSource {

    var indexPageNumber = 1
    var genreId : Int?
    @IBOutlet weak var tableViewPopularMovies: UITableView!{
        didSet{
            AppUtils.registerCellToTable("MovieTableCell", tableView: self.tableViewPopularMovies)
        }
    }
    var results : [Results] = []
    
    init(genreId : Int?) {
        super.init(nibName: "MoviesListVC", bundle: nil)
        
        if let genreId = genreId
        {
            self.genreId = genreId
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Popular movies"
        self.getPopularMovies()
    }

    func getPopularMovies()
    {
        self.showProgress(view: self.view)
        WebServices.sharedInstance.getPopularMoviesBy(pageNumber: indexPageNumber, { [weak self](PopularMoviesResponse) in
            
            guard let self = self else{return}
            
            self.hideProgress()
            if let results = PopularMoviesResponse.results{
                self.results += results
                self.tableViewPopularMovies.reloadData()
            }
            
        }) { (ErrorResponse) in
            
            self.hideProgress()
            
            if let errorMessage = ErrorResponse.status_message{
                
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    // MARK: UITableView delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MovieTableCell = tableView.dequeueReusableCell(withIdentifier: "MovieTableCell", for: indexPath) as! MovieTableCell
        
        cell.selectionStyle = .none
        
        let movieItem : Results = self.results[indexPath.row]
        cell.lblTitle.text = movieItem.original_title ?? "<No Title>"
        
        if let backDropPath = movieItem.backdrop_path {
            cell.imgMovie.sd_setImage(with: URL(string: RequestBuilder.ServicePath.BaseImage + backDropPath
            )) { (image, error, type, url) in
                cell.imgMovie.image = image
            }
        }
        

        
        if let genreIds = movieItem.genre_ids{
            if (genreIds.contains(self.genreId!))
            {
                cell.backgroundColor = AppUtils.getGenreColor(genreId: self.genreId ?? 0)
            }
            else
            {
                cell.backgroundColor = UIColor.white
            }
        }
        else
        {
            cell.backgroundColor = UIColor.white
        }

        if (indexPath.row + 1 == self.results.count) && (self.indexPageNumber < 5)
        {
            self.indexPageNumber = self.indexPageNumber + 1
            self.getPopularMovies()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movieDetailsVC = MovieDetailsVC(movieDetails: self.results[indexPath.row])
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }

}



