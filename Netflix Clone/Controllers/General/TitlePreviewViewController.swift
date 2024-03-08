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
        
        previewMovieView.reviewView.reviewTable.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
        
        previewMovieView.genreCollectionView.dataSource = self
        previewMovieView.genreCollectionView.delegate = self
        
        previewMovieView.reviewView.reviewTable.dataSource = self
        previewMovieView.reviewView.reviewTable.delegate = self
        
    }
    
    func configure(with model: TitlePreviewViewModel) {
        do {
            movieDetails = try APICaller.shared.getMoviesDetail(movie_id: model.movie_id)
        } catch {
            print(error.localizedDescription)
        }
        
        guard let movieDetails = movieDetails else {
            return
        }
        title = movieDetails.original_name ?? movieDetails.original_title ?? ""
        previewMovieView.topContentView.titleLabel.text = movieDetails.original_name ?? movieDetails.original_title ?? ""
        previewMovieView.topContentView.infoAboveTitleLabel.text = getInfoAboveTitle(runtime: movieDetails.runtime ?? 0, releaseDate: movieDetails.release_date ?? "")
        previewMovieView.topContentView.ratingLabel.text = getVoteAverage(voteAverage: movieDetails.vote_average )
        previewMovieView.topContentView.voteCountLabel.text = "(\(movieDetails.vote_count))"
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {return}
//        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.backdrop_path ?? "")") else {
//            return
//        }
//        previewMovieView.topContentView.webView.sd_setImage(with: url,completed: nil)
        previewMovieView.topContentView.webView.load(URLRequest(url: url))
        
        do {
            reviewResponse = try APICaller.shared.getReviewsMovie(movie_id: model.movie_id)
        } catch {
            print(error.localizedDescription)
        }
        
        guard let reviewResponse = reviewResponse else {
            return
        }
        
        previewMovieView.overviewLabel.text = movieDetails.overview ?? ""
        
        updateGenre(genres: movieDetails.genres)
        
        handleReviewData(reviews: reviewResponse.results)
        
//        resizeScrollView()
    }
    
    func getVoteAverage(voteAverage: Float) -> String {
        
        let voteAverage = round(voteAverage * 10) / 10.0
        
        if voteAverage == Float(Int(voteAverage)) {
            return "\(Int(voteAverage))"
        } else {
            return "\(voteAverage)"
        }
    }
    
    func handleReviewData(reviews: [Reviews]) {
        
        review = reviews
        previewMovieView.reviewView.reviewTable.reloadData()
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
    
//    override func viewDidAppear(_ animated: Bool) {
//        resizeScrollView()
//    }
//    
//    func resizeScrollView() {
//        
//        view.layoutIfNeeded()
//        let contentRect: CGRect = previewMovieView.contentView.frame
//        
//        previewMovieView.scrollView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            previewMovieView.scrollView.heightAnchor.constraint(equalToConstant: contentRect.size.height),
//            previewMovieView.scrollView.widthAnchor.constraint(equalToConstant: contentRect.size.width)
//        ])
//        
//        previewMovieView.scrollView.contentSize = contentRect.size
//    }

    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension TitlePreviewViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return movieDetails?.genres.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return setGenreCell(collectionView: collectionView, indexPath: indexPath)
        
    }
    
    func setGenreCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.identifier, for: indexPath) as! GenreCollectionViewCell
        
//        print(movieDetails?.genres[indexPath.row])
//        print(review)
        cell.label.text = movieDetails?.genres[indexPath.row].name
        cell.label.font = .systemFont(ofSize: 12)
        
        
        return cell
    }
    
}

extension TitlePreviewViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return review.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return setReviewCell(tableView: tableView, indexPath: indexPath)
    }
    
    func setReviewCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else {return UITableViewCell()}
        
        print(review)
//        cell.authorLabel.text = review[indexPath.row].author
//        cell.contentLabel.text = review[indexPath.row].content
        cell.authorLabel.text = "Khodi"
        cell.contentLabel.text = "Keren sangat"
        
        
        return cell
    }
    
    
}
