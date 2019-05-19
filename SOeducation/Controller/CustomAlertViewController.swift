//
//  CustomAlertViewController.swift
//  SOeducation
//
//  Created by Robson James Junior on 18/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {

    
    @IBOutlet weak var popViewBackground: UIView!
    
    @IBOutlet weak var labelInfoAboutCommands: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        labelInfoAboutCommands.text = commandsTerminal
        
        popViewBackground.layer.cornerRadius = 16

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DoneButtonHelper(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    

}
