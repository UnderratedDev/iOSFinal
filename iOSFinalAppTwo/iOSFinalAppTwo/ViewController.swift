//
//  ViewController.swift
//  iOSFinalAppTwo
//
//  Created by Yudhvir Raj on 2017-12-08.
//  Copyright © 2017 Yudhvir Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var message: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if appDelegate.query != nil {
            print (appDelegate.query)
            message.font = UIFont(name: "Optima-BoldItalic", size: 40.0)
            message.text = appDelegate.query
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

