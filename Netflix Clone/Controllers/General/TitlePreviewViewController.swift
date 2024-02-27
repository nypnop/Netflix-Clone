//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 06/03/24.
//

import UIKit
import WebKit

class TitlePreviewViewController: UIViewController {
    
    let previewMovieView = PreviewMovieView()
    var movieDetails: MovieResponse?
    var reviewResponse: ReviewsResponse?
    var review = [Reviews]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = previewMovieView
        view.backgroundColor = .systemBackground

        previewMovieView.genreCollectionView.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.identifier)
        
        previewMovieView.reviewView.reviewCollectionView.register(ReviewCollectionViewCell.self, forCellWithReuseIdentifier: ReviewCollectionViewCell.identifier)
        
        previewMovieView.genreCollectionView.dataSource = self
        previewMovieView.genreCollectionView.delegate = self
        
        previewMovieView.reviewView.reviewCollectionView.delegate = self
        previewMovieView.reviewView.reviewCollectionView.dataSource = self
        
    }
    
    func configure(with model: TitlePreviewViewModel) {
        do {
            movieDetails = try APICaller.shared.getMoviesDetail(movie_id: model.movie_id)
        } catch {
            print(error)
        }
        
        guard let movieDetails = movieDetails else {
            return
        }
        title = movieDetails.original_name ?? movieDetails.original_title ?? ""
        previewMovieView.topContentView.titleLabel.text = movieDetails.original_name ?? movieDetails.original_title ?? ""
        previewMovieView.overviewLabel.text = movieDetails.overview ?? ""
        updateGenre(genres: movieDetails.genres)
        previewMovieView.topContentView.infoAboveTitleLabel.text = getInfoAboveTitle(runtime: movieDetails.runtime ?? 0, releaseDate: movieDetails.release_date ?? "")
        previewMovieView.topContentView.ratingLabel.text = getVoteAverage(voteAverage: movieDetails.vote_average ?? 0)
        previewMovieView.topContentView.voteCountLabel.text = "(\(movieDetails.vote_count))"
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {return}
//        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.backdrop_path)") else {
//            return
//        }
//        previewMovieView.topContentView.webView.sd_setImage(with: url,completed: nil)
        previewMovieView.topContentView.webView.load(URLRequest(url: url))
        
        do {
            reviewResponse = try APICaller.shared.getReviewsMovie(movie_id: model.movie_id)
        } catch {
            print(error)
        }
        
        handleReviewData(review: reviewResponse!.results)
        
        
        resizeScrollView()
        
    }
    
    @objc func seeAllCastPressed() {
        
        if review.isEmpty {
            return
        }
        
//        let vc = AllCastTableViewController()
//        vc.cast = cast
//        vc.title = "Review"
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getVoteAverage(voteAverage: Float) -> String {
        
        let voteAverage = round(voteAverage * 10) / 10.0
        
        if voteAverage == Float(Int(voteAverage)) {
            return "\(Int(voteAverage))"
        } else {
            return "\(voteAverage)"
        }
    }
    
    func handleReviewData(review: [Reviews]) {
        
        self.review = review
        
        previewMovieView.reviewView.reviewCollectionView.reloadData()
    }
    
    func updateGenre(genres: [Genre]) {
        
        if genres.count <= 1 {
            previewMovieView.genreCollectionView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }
        
        previewMovieView.genreCollectionView.reloadData()
    }
    
    func getInfoAboveTitle(runtime: Int, releaseDate: String) -> String? {
        
        if !releaseDate.isEmpty {
            
            let releaseYear = releaseDate.prefix(4)
            
            if runtime == 0 {
                return "\(releaseYear)"
            } else {
                return "\(releaseYear) ٠ \(runtime) mins"
            }
        }
        return nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        resizeScrollView()
    }
    
    func resizeScrollView() {
        
        view.layoutIfNeeded()
        let contentRect: CGRect = previewMovieView.contentView.frame
        
        previewMovieView.scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previewMovieView.scrollView.heightAnchor.constraint(equalToConstant: contentRect.size.height),
            previewMovieView.scrollView.widthAnchor.constraint(equalToConstant: contentRect.size.width)
        ])
        
        previewMovieView.scrollView.contentSize = contentRect.size
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension TitlePreviewViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == previewMovieView.reviewView.reviewCollectionView {
            return review.count < 15 ? review.count : 14
        } else {
            return movieDetails?.genres.count ?? 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == previewMovieView.reviewView.reviewCollectionView {
            return setReviewCell(collectionView: collectionView, indexPath: indexPath)
        } else {
            return setGenreCell(collectionView: collectionView, indexPath: indexPath)
        }
        
    }
    
    func setReviewCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCollectionViewCell.identifier, for: indexPath) as! ReviewCollectionViewCell
        
        cell.authorLabel.text = review[indexPath.row].author
        cell.dateLabel.text = review[indexPath.row].updated_at
        cell.contentLabel.text = review[indexPath.row].content
        
        return cell
    }
    
    func setGenreCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as! GenreCollectionViewCell
        
        cell.label.text = movieDetails?.genres[indexPath.row].name
        cell.label.font = .systemFont(ofSize: 12)
        
        
        return cell
    }
    
}
