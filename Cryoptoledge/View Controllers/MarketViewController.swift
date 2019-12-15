//
//  MarketViewController.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 12/06/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController,UITableViewDelegate {

    @IBOutlet weak var tabView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.backgroundView?.backgroundColor = .clear
        tabView.backgroundColor = .clear

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MarketViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = Bundle.main.loadNibNamed("MarketTableViewCell", owner: self, options: nil)?.first as! MarketTableViewCell
        return tempCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundView?.backgroundColor = .clear
        cell.backgroundColor = .clear
    }
}
