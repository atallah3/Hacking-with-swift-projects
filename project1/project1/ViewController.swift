//
//  ViewController.swift
//  project1
//
//  Created by Abd Elrahman Atallah on 03/11/2023.
//

import UIKit

class ViewController: UITableViewController {

    var pictures : [String] = []
    var sortedPic : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        sortedPic = pictures.sorted()
        cell.textLabel?.text = sortedPic[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc =  storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
            sortedPic = pictures.sorted()
            vc.selectedImage = sortedPic[indexPath.row]
            vc.indexPath = indexPath.row + 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

