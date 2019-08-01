//
//  PodcastVC.swift
//  Newcast
//
//  Created by Nikhil Bolar on 7/31/19.
//  Copyright © 2019 Nikhil Bolar. All rights reserved.
//

import Cocoa
import Alamofire
import SWXMLHash
import FeedKit

var podcasts : [String]! = []

class PodcastVC: NSViewController {

    @IBOutlet weak var backgroundImage: NSImageView!
    @IBOutlet weak var addPodcastButton: NSButton!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        backgroundImage.alphaValue = 0.6
        addPodcastButton.alphaValue = 0.8
        collectionView.dataSource = self
        collectionView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: NSNotification.Name(rawValue: "updateUI"), object: nil)
    }
    
    @objc func updateUI(){
        collectionView.reloadData()
    }
    
    @IBAction func addPodcastClicked(_ sender: Any) {
        podcasts.insert("Hello", at: 0)
        collectionView.reloadData()
//        let url = URL(string: "https://atp.fm/episodes?format=rss")
//        let url = URL(string: "https://itunes.apple.com/search?term=\(podcastTextField.stringValue)&media=podcast&limit=15")
//
//        AF.request(url!).responseData { (response) in
//            let parser = Parser()
//            self.feedURL = parser.parsePodcastMetaData(response.data!)
//            self.podcastListing()
//        }
        
//        let parser = FeedParser(URL: url!)
//        let result = parser.parse()
//        let feed = result.jsonFeed
        
//        let feed = result.rssFeed
//
//        for i in 0..<feed!.items!.count{
//            let item = feed!.items?[i]
//            print("\(item!.title!) --  \(item!.pubDate!)")
//
//        }
        
//        guard let feed = result.rssFeed, result.isSuccess else {
//            print(feed.title)
//            return
//        }
        
    }
    
    func highlightItems(selected: Bool, atIndexPaths: Set<NSIndexPath>) {
        for indexPath in atIndexPaths {
            guard let item = collectionView.item(at: indexPath as IndexPath) else {continue}
            (item as! PodcastCellView).setHighlight(selected: selected)
            
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension PodcastVC: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let forecastItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "PodcastCellView"), for: indexPath)
        
//        guard let forecastCell = forecastItem as? PodcastCellView else { return forecastItem}
//        forecastCell.configureCell(weatherCell: WeatherService.instance.forecast[indexPath.item])
        
        
        return forecastItem
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        highlightItems(selected: true, atIndexPaths: indexPaths as Set<NSIndexPath>)
    }
    func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
        highlightItems(selected: false, atIndexPaths: indexPaths as Set<NSIndexPath>)
    }
    
    
}
