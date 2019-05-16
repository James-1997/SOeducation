//
//  TerminalViewController.swift
//  SOeducation
//
//  Created by Robson James Junior on 15/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import UIKit

class TerminalViewController: UIViewController {
    
    var clickBool: Bool = false
    var command: String = ""
    var logCommand: [String] = []
    
    @IBOutlet weak var TextTerminal: UILabel!
    
    @IBOutlet weak var textFieldCommand: UITextField!
    
    @IBOutlet weak var BackGroundTerminal: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BackGroundTerminal.backgroundColor = backGroundTerminalColor
        
    }
    
    
    @IBAction func commandSend(_ sender: Any) {
        //Comando TextField
       // TextTerminal.textColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        let command = textFieldCommand.text!
        logCommand.append(command)
        TextTerminal.text = ""
        for cmd in logCommand {
            TextTerminal.text! += ("\n \(cmd)")
            print("\(cmd)")
        }
        
    }
    
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
