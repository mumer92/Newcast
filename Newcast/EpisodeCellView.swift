//
//  EpisodeCellView.swift
//  Newcast
//
//  Created by Nikhil Bolar on 8/4/19.
//  Copyright © 2019 Nikhil Bolar. All rights reserved.
//

import Cocoa
import SDWebImage

class EpisodeCellView: NSCollectionViewItem {

    @IBOutlet weak var episodeTitleField: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = CGColor.init(gray: 0.9, alpha: 0.2)
        self.view.layer?.cornerRadius = 8
        self.view.layer?.borderColor = NSColor.white.cgColor
        self.view.layer?.borderWidth = 0.0
    }
    
    func setHighlight(selected: Bool) {
        view.layer?.borderWidth = selected ? 2.0 : 0.0
    }
    func configureEpisodeCell(episodeCell: Episodes){
        episodeTitleField.stringValue = episodeCell.title
    }
    
}
