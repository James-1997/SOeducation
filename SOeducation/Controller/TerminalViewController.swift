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
       // TextTerminal.font = UIFont(name: "SimplePixel.tff", size: 24)
        BackGroundTerminal.backgroundColor = backGroundTerminalColor
        TextTerminal.text = "BitDev://Digite o comando"
        
    }
    
    
    @IBAction func commandSend(_ sender: Any) {
        if clickBool == false {
            clickBool = true
            TextTerminal.text = ""
            let command = textFieldCommand.text!
            logCommand.append(command)
            _ = commandAnalisys(cmd: command)
            imprimirLog(ArrayLog: logCommand)
        }
    }
    
    func imprimirLog (ArrayLog: [String]) {
        for cmd in ArrayLog {
            TextTerminal.text! += ("\n BitDev://\(cmd)")
        }
    }
    
    func commandAnalisys(cmd: String){
        switch cmd {
        case "open":
            clickBool = false
        default:
            clickBool = false
            logCommand.append("Comando não reconhecido")
        }
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
