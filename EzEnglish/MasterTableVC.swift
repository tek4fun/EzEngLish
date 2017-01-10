//
//  MasterTableVC.swift
//  EzEnglish
//
//  Created by iOS Student on 1/10/17.
//  Copyright © 2017 tek4fun. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    var dictList = ["Fruits" : "fruits.png", "Animals" : "animals.jpeg"]

    override func viewDidLoad() {
        super.viewDidLoad()


    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dictList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        var arrayKey = Array(dictList.keys)
        cell.textLabel?.text = arrayKey[indexPath.row]
        cell.imageView?.image = UIImage(named: dictList["\(arrayKey[indexPath.row])"]!)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetail")
        {
            let detailVC = segue.destination as! DetailVC

            let selectedRowIndex: IndexPath = self.tableView.indexPathForSelectedRow!

            let selectedCell: UITableViewCell = self.tableView.cellForRow(at: selectedRowIndex)!

            detailVC.stringTitle = selectedCell.textLabel?.text
        }
    }
    
    
}
