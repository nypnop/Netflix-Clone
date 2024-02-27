//
//  ResultViewController.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 08/03/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    public var titles: [Title] = [Title]()
    
    public let resultCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view = resultCollectionView
        print("already loaded")
        
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultCollectionView.frame = view.bounds
    }
    
    public func configure(with title: [Title]) {
        print(title)
        titles = title
//        print(titles)
        DispatchQueue.main.async { [weak self] in
            self?.resultCollectionView.reloadData()
        }
        
    }

}

extension ResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "")
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let title = titles[indexPath.row]
        let titleName = title.original_name ?? title.original_title ?? ""
        let viewModel = TitlePreviewViewModel(movie_id: title.id, backdrop_path: title.backdrop_path)
        let vc = TitlePreviewViewController()
        vc.configure(with: viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
//        APICaller.shared.getMovie(with: titleName) { [weak self] result in
//            switch result {
//            case .success(let videoElement):
//                DispatchQueue.main.async {
//                    let vc = TitlePreviewViewController()
//                    vc.configure(with: TitlePreviewViewModel(movie_id: title.id, youtubeView: videoElement))
//                    self?.navigationController?.pushViewController(vc, animated: true)
//                }
//                
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        
    }
}
