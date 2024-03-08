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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        genreTable.frame = view.bounds
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let vc = MoviesCollectionViewController(collectionViewLayout: layout)
        
        let genre = genres[indexPath.row]
        vc.title = genre.name
        vc.genre = genre.id

        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }

}



