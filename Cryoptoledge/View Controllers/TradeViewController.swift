//
//  TradeViewController.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 10/06/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class TradeViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
tableView.backgroundView?.backgroundColor = .clear
        tableView.backgroundColor = .clear
        // Do any additional setup after loading the view.
    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension TradeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count-1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tempCell = Bundle.main.loadNibNamed("TradeViewTableViewCell", owner: self, options: nil)?.first as! TradeViewTableViewCell
        tempCell.fullname.text! = currencyList[indexPath.row].name
        tempCell.shortName.text! = currencyList[indexPath.row].short
        tempCell.value.text! = currencyList[indexPath.row].price
        if currencyList[indexPath.row].upD > 0.0 {
            tempCell.updownImage.image! = #imageLiteral(resourceName: "GreenArrow")
        } else {
            tempCell.updownImage.image! = #imageLiteral(resourceName: "RedArrow")
            
        }
        return tempCell
    }
   
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundView?.backgroundColor = .clear
        cell.backgroundColor = .clear
    }
    
}
