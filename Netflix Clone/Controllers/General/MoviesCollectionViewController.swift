//
//  MoviesCollectionViewController.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 08/03/24.
//

import UIKit



class MoviesCollectionViewController: UICollectionViewController {
    
    static let identifier = "MoviesCollectionViewController"
    
    var titles: [Title] =  [Title]()
    var genre: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.tintColor = UIColor.label
        navigationItem.backButtonTitle = ""

        
        loadData()
        
    }

    
    func loadData() {
        
        APICaller.shared.getMoviesbyGenre(with: self.genre) { [weak self] result in
            
            switch result {
            case .success(let title):
                self?.titles = title
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
                    
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "")
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let title = titles[indexPath.row]
        
        guard let titleName = title.original_name ?? title.original_title else {
            return
        }
        
//        let viewModel = TitlePreviewViewModel(movie_id: title.id, backdrop_path: title.backdrop_path)
//        let vc = TitlePreviewViewController()
//        vc.configure(with: viewModel)
//        self.navigationController?.pushViewController(vc, animated: true)
        APICaller.shared.getMovie(with: titleName) { [weak self] result in
            switch result {
            case .success(let videoElement):
                DispatchQueue.main.async{
                    let vc = TitlePreviewViewController()
                    vc.configure(with: TitlePreviewViewModel(movie_id: title.id, youtubeView: videoElement))
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}



// MARK: - UICollectionViewDelegateFlowLayout
//
extension MoviesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.3, height: self.view.frame.width * 0.4)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
     
}
