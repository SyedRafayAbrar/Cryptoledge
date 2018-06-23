//
//  ViewController.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 20/04/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit
import SlideMenuController

class ViewController: UIViewController, UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView?.backgroundColor = .clear
        tableView.backgroundColor = .clear
       Datafetch()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func menuPressed(_ sender: Any) {
self.slideMenuController?.showLeft()
        
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
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count-1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell = Bundle.main.loadNibNamed("MainViewTableViewCell", owner: self, options: nil)?.first as! MainViewTableViewCell
        tempCell.fullName.text! = currencyList[indexPath.row]["Name"]!
        tempCell.shortname.text! = currencyList[indexPath.row]["Short"]!
        tempCell.value.text! = currencyList[indexPath.row]["Price"]!
            if updown[indexPath.row] > 0 {
                tempCell.updownImage.image! = #imageLiteral(resourceName: "prizeboxBC")
            } else {
                tempCell.updownImage.image! = #imageLiteral(resourceName: "prizebox_Red")

            }
        
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
    
    func Datafetch() {
        let url = URL(string: "https://api.coinmarketcap.com/v2/ticker/")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if let urlContent = data {
                    do {
                        let JsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                        if let JsonContent = JsonResult as? [String:Any] {
                            if let JsonData = JsonContent["data"] as? [String:Any]{
                                
                                //loop Starts Here
                                for i in 1...1000{
                                    if let JSONName = JsonData["\(i)"] as? [String:Any] {
                                        if let Name = JSONName["name"] as? String {
                                            currency["Name"] = Name
                                        }
                                        if let Short = JSONName["symbol"] as? String {
                                            currency["Short"] = Short
                                        }
                                        if let Price = JSONName["quotes"] as? [String:Any] {
                                            if let LatestPrice = Price["USD"] as? [String:Any]{
                                                if let NowPrice = LatestPrice["price"] as? Double {
                                                    currency["Price"] = "\(NowPrice / 1000.0)"
                                                }
                                                if let up_Down = LatestPrice["percent_change_24h"] as? Double {
                                                    updown.append(up_Down)
                                                }
                                            }
                                        }
                                        //                                        print(currency)
                                        currencyList.append(currency)
                                    }
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
                                    }
                                }
                                
                            }
                        }
                        
                    } catch {
                        print("Error Occured")
                    }
                }
            }
        }
        task.resume()

    }
    
}
