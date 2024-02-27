//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 27/02/24.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        // initiate si viewcontroller
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let upcomingVC = UINavigationController(rootViewController: UpcomingViewController())
        let topSearchVC = UINavigationController(rootViewController: TopSearchViewController())
        let genreVC = UINavigationController(rootViewController: DownloadViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        upcomingVC.tabBarItem.image = UIImage(systemName: "play.circle")
        topSearchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        genreVC.tabBarItem.image = UIImage(systemName: "movieclapper.fill")
        
        homeVC.title = "Home"
        upcomingVC.title = "Coming Soon"
        topSearchVC.title = "Top Search"
        genreVC.title = "Genre"
        
        tabBar.tintColor = .label
        
        setViewControllers([homeVC, upcomingVC, topSearchVC, genreVC], animated: true)
    }


}

