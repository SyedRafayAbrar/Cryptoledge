//
//  ListViewController.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 27/06/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView?.backgroundColor = .clear
        tableView.backgroundColor = .clear

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

extension ListViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = Bundle.main.loadNibNamed("MainViewTableViewCell", owner: self, options: nil)?.first as! MainViewTableViewCell
        tempCell.fullName.text! = currencyList[indexPath.row].name
        tempCell.shortname.text! = currencyList[indexPath.row].short
        tempCell.value.text! = currencyList[indexPath.row].price
        if currencyList[indexPath.row].upD > 0.0000 {
            tempCell.updownImage.image! = #imageLiteral(resourceName: "GreenArrow")
        } else {
            tempCell.updownImage.image! = #imageLiteral(resourceName: "RedArrow")
            
        }
        tempCell.exchangeLabel.text = exchangeName
        
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
