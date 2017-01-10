//
//  ImageViewController.swift
//  EzEnglish
//
//  Created by iOS Student on 1/10/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    var imageName: String?

    @IBOutlet weak var imgView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.image = UIImage(named: imageName!)

    }

    }
