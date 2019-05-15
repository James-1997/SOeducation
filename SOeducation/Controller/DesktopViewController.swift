//
//  DesktopViewController.swift
//  SOeducation
//
//  Created by Robson James Junior on 15/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import UIKit

class DesktopViewController: UIViewController {
    
    @IBOutlet weak var DesktopView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DesktopView.backgroundColor = backGroundDesktopColor
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
