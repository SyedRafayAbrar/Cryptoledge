//
//  ViewController.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 20/04/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView?.backgroundColor = .clear
        tableView.backgroundColor = .clear
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func statsPressed(_ sender: Any) {
        
    }
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let tempCell = Bundle.main.loadNibNamed("MainViewTableViewCell", owner: self, options: nil)?.first as! MainViewTableViewCell
        return tempCell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundView?.backgroundColor = .clear
        cell.backgroundColor = .clear
    }
    
}
