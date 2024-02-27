//
//  DownloadViewController.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 27/02/24.
//

import UIKit

class DownloadViewController: UIViewController {
    
    private var genres: [Genre] = [Genre]()
    
    private let genreTable: UITableView = {
        let table = UITableView()
        table.register(GenreTableViewCell.self, forCellReuseIdentifier: GenreTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(genreTable)
        genreTable.delegate = self
        genreTable.dataSource = self
        navigationItem.title = "Genres"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = UIColor.label
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        fetchGenres()
    }
    
    private func fetchGenres() {
        APICaller.shared.getMoviesGenre() { [weak self] result in
            switch result {
            case.success(let genres):
                self?.genres = genres
                DispatchQueue.main.async {
                    self?.genreTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        print(genres)
    }
}
    
extension DownloadViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:GenreTableViewCell.identifier, for: indexPath) as? GenreTableViewCell else {
            return UITableViewCell()
        }

        let list = genres[indexPath.row]
        cell.textLabel?.text = list.name
        cell.backgroundColor = UIColor(named: "cellMainColor")
        cell.accessoryType = .disclosureIndicator

        return cell
    }


    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }


    //    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let subView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 70))
    //
    //        let label = UILabel(frame: CGRect(x: 15, y: 10, width: subView.frame.width ,height: subView.frame.height))
    //        label.text = ( section == 0 ? "Movies" : "TV Shows" )
    //        label.font = .systemFont(ofSize: 25, weight: .bold)
    //
    //        subView.addSubview(label)
    //
    //        return subView
    //    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    //        let layout = UICollectionViewFlowLayout()
    //        let vc = MoviesCollectionViewController(collectionViewLayout: layout)
    //
    //        let list = lists[indexPath.section][indexPath.row]
    //        vc.title = list.listName
    //        vc.url = list.url
    //        vc.mediaType = ( indexPath.section == 0 ? .movie : .tvShow )
    //
    //        vc.navigationItem.largeTitleDisplayMode = .never
    //        navigationController?.pushViewController(vc, animated: true)

    }


    func didSelectCell(id: Int, type: String) {
        
    //        let vc = getVC(id: id, type: type)
    //        vc.navigationItem.largeTitleDisplayMode = .never
    //        searchController.searchBar.text = ""
    //        navigationController?.pushViewController(vc, animated:true)
    //        searchController.isActive = false
        
    }


    //    func getVC(id: Int, type: String) -> UIViewController {
    //
    //        if type == "movie" {
    //            let vc = MovieDetailsViewController()
    //            vc.movieId = id
    //            return vc
    //
    //        } else if type == "tv" {
    //            let vc = TVShowDetailsViewController()
    //            vc.showId = id
    //            return vc
    //
    //        } else {
    //            let vc = PersonDetailsViewController()
    //            vc.personId = id
    //            return vc
    //
    //        }
    //    }

}



