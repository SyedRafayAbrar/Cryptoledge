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
        tableView.layer.borderWidth = 2
tableView.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func menuPressed(_ sender: Any) {
self.slideMenuController?.showLeft()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.global(qos: .background).async {
                self.Datafetch()
        }
        

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
        return currencyList.count
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
    
    func Datafetch() {
        
            currencyList.removeAll()
                let _url = URL(string: "https://api.coinmarketcap.com/v2/ticker/?convert=\(exchangeName)")!
        
        let task = URLSession.shared.dataTask(with: _url) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "No Internet Connection", preferredStyle: .alert)
                let ok = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                let openSettings = UIAlertAction(title: "Open Setting", style: .default, handler: { (action: UIAlertAction) in
                    if let url = URL(string:UIApplicationOpenSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            let url =  UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
                    }
                })
                alert.addAction(ok)
                alert.addAction(openSettings)
                self.present(alert, animated: true, completion: nil)
                print(error?.localizedDescription)
            } else {
                if let urlContent = data {
                    do {
                        let JsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                        if let JsonContent = JsonResult as? [String:Any] {
                            if let JsonData = JsonContent["data"] as? [String:Any]{
                                
                                //loop Starts Here
                                for i in 1...2000{
                                    var currency = _currency()
                                    if let JSONName = JsonData["\(i)"] as? [String:Any] {
                                        if let Name = JSONName["name"] as? String {
                                            currency.name = Name
                                        }
                                        if let Short = JSONName["symbol"] as? String {
                                            currency.short = Short
                                        }
                                        if let Price = JSONName["quotes"] as? [String:Any] {
                                            
                                                if let LatestPrice = Price[exchangeName] as? [String:Any]{
                                                    if let NowPrice = LatestPrice["price"] as? Double {
                                                        currency.price = "\(NowPrice)"
                                                    }
                                                    if let up_Down = LatestPrice["percent_change_24h"] as? Double {
                                                        currency.upD = up_Down
                                                    }
                                                }
                                            
                                            
                                           
                                        }
                                        
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
