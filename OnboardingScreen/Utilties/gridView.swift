//
//  gridView.swift
//  OnboardingScreen
//
//  Created by Ashutosh Arage on 14/09/20.
//  Copyright © 2020 Ashutosh Arage. All rights reserved.
//

import UIKit

class gridView: UICollectionViewCell {
     @IBOutlet weak var gridImageView: UIImageView!

    public func config(with image: UIImage) {
        gridImageView.image = image
    }
}
