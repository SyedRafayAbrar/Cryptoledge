//
//  ViewController.swift
//  Cryoptoledge
//
//  Created by Syed  Rafay on 20/04/2018.
//  Copyright © 2018 Syed  Rafay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var blurVeiw: UIVisualEffectView!
    @IBOutlet weak var rightSideView: UIView!
    @IBOutlet weak var rightSideViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var leftsideView: UIView!
    @IBOutlet weak var leftsideViewLeading: NSLayoutConstraint!
    @IBOutlet weak var rightBlur: UIVisualEffectView!
    
    @IBOutlet weak var statsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        rightBlur.layer
        leftsideViewLeading.constant = -128
        rightSideViewTrailing.constant = -128
        blurVeiw.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        leftsideViewLeading.constant = 0
        rightSideViewTrailing.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded() })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func infoPressed(_ sender: Any) {
        leftsideViewLeading.constant = -128
        rightSideViewTrailing.constant = -128
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded() })
    }
    
    @IBAction func statsPressed(_ sender: Any) {
        
    }
}

