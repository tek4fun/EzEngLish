//
//  DetailVC.swift
//  EzEnglish
//
//  Created by iOS Student on 1/10/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var stringTitle: String!
    var dictData: NSDictionary!
    var arrayKeys: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = stringTitle
        self.createDataWithName(title: stringTitle)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func createDataWithName(title: String)
    {
        var path: String = ""
        if (title == "Fruits")
        {
            path = Bundle.main.path(forResource: "FruitsList", ofType: "plist")!
        }
        if (title == "Animals")
        {
            path = Bundle.main.path(forResource: "AnimalsList", ofType: "plist")!
        }
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys as NSArray!

        arrayKeys = arrayKeys.sortedArray(using: #selector(NSNumber.compare(_:))) as NSArray!
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let key: String = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key

        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageController = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        let key: String = arrayKeys[indexPath.row] as! String
        imageController.imageName = dictData[key] as? String
        navigationController?.pushViewController(imageController, animated: true)

        print("\(indexPath.row) - \(arrayKeys[indexPath.row])")
    }

}
