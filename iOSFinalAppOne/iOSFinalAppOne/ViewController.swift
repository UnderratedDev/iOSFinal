//
//  ViewController.swift
//  iOSFinalAppOne
//
//  Created by Yudhvir Raj on 2017-12-08.
//  Copyright © 2017 Yudhvir Raj. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var message: UITextField!
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func textToSpeech(_ sender: UIButton) {
        let tMessage = message.text
        
        print (tMessage)
        
        let alertController = UIAlertController(title: "Dialog", message: "Options", preferredStyle: UIAlertControllerStyle.alert) //Replace UIAlertControllerStyle.Alert by
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let speechAction = UIAlertAction(title: "Speech", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("Speech")
            self.myUtterance = AVSpeechUtterance(string: tMessage!)
            self.myUtterance.rate = 0.3
            self.synth.speak(self.myUtterance)
        }
        
        let openAction = UIAlertAction(title: "Open", style: UIAlertActionStyle.default) {
            (result : UIAlertAction) -> Void in
            print("Open")
            let urlStr = "apptwo://?" + tMessage!
            let url = URL(string: urlStr)
            if UIApplication.shared.canOpenURL(url!)
            {
                UIApplication.shared.openURL(url!)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(speechAction)
        alertController.addAction(openAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

