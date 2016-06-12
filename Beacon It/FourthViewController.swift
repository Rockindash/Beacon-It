//
//  FourthViewController.swift
//  Beacon It
//
//  Created by amol kumar on 11/06/16.
//  Copyright © 2016 amol kumar. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func call(sender: UIButton) {
        
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://9855557554")!)
    }
    

}
