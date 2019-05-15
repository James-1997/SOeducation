//
//  TerminalViewController.swift
//  SOeducation
//
//  Created by Robson James Junior on 15/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import UIKit

class TerminalViewController: UIViewController {
    
    
    @IBOutlet weak var BackGroundTerminal: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BackGroundTerminal.backgroundColor = backGroundTerminalColor
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
