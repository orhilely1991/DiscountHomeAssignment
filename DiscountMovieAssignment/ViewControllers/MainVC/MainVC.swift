//
//  MainVC.swift
//  DiscountMovieAssignment
//
//  Created by or hilely on 26/03/2020.
//  Copyright © 2020 or hilely. All rights reserved.
//

import UIKit

class MainVC: BaseVC ,UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionViewGenres: UICollectionView!{
        didSet{
            AppUtils.registerCellToCollectionView("GenresCollectionViewCell", collectionView: self.collectionViewGenres)
        }
    }
    
    var genres : [Genres]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ChalkboardSE-Regular", size: 20)!]
        
        self.title = "Genres"
        self.getGenres()
    }

    
    func getGenres()
    {
        self.showProgress(view: self.view)
        WebServices.sharedInstance.getGenres({ [weak self](GenresResponse) in
            guard let self = self else{return}
            
            self.hideProgress()
            
            if let genres = GenresResponse.genres{
                self.genres = genres
                self.collectionViewGenres.reloadData()
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
}

extension MainVC
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenresCollectionViewCell", for: indexPath) as! GenresCollectionViewCell

        cell.lblTitle.text = self.genres![indexPath.row].name ?? ""
        
        cell.backgroundCellView.backgroundColor = AppUtils.getGenreColor(genreId: self.genres![indexPath.row].id ?? 0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemSize = (self.collectionViewGenres.bounds.width/3.0) - 20
        let size = CGSize(width: itemSize, height: itemSize)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let moviesListVC : MoviesListVC = MoviesListVC(genreId: self.genres![indexPath.row].id)
        self.navigationController?.pushViewController(moviesListVC, animated: true)
    }
    
}
