//
//  ViewController.swift
//  iOS-demo
//
//  Created by Jake Chang on 2023/3/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //
    var tableArray1: [String] = []
    var tableArray2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        tableArray1.append("Collection Basic")
        
        tableArray2.append("Circle Basic")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tableArray1.count
        }
        else {
            return tableArray2.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.accessoryType = .disclosureIndicator
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = tableArray1[indexPath.row]
        }
        else {
            cell?.textLabel?.text = tableArray2[indexPath.row]
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewController1")
                self.navigationController?.pushViewController(controller!, animated: true)
            }
        }
        else {
            if indexPath.row == 0 {
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "CircleViewController1")
                self.navigationController?.pushViewController(controller!, animated: true)
            }
        }
       
    }
    
}
