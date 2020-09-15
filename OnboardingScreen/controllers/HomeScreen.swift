//
//  ViewController.swift
//  ImageSlider
//
//  Created by Ashutosh Arage on 14/09/20.
//  Copyright © 2020 Ashutosh Arage. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var gridCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
//    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    let images = [
    UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5")
    ]
    var timmer: Timer?
    var currentIndex = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
          navigationItem.hidesBackButton = true
        pageController.numberOfPages = images.count
        startTimmer()
    }
    
    func startTimmer() {
        timmer = Timer.scheduledTimer(timeInterval: 2.9, target: self, selector: #selector(timmerAction), userInfo: nil, repeats: true)
    }

    @objc func timmerAction() {
        
        let desireScrollPosition  = (currentIndex < images.count - 1 ) ?  currentIndex + 1 : 0
        
        collectionView.scrollToItem(at: IndexPath(item: desireScrollPosition, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                  navigationController?.isNavigationBarHidden = true
       
    }

}


extension HomeScreen : UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        cell.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / collectionView.frame.size.width)
        pageController.currentPage = currentIndex
    }
}

extension HomeScreen : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenTableViewCell",for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
