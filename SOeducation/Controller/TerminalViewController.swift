//
//  TerminalViewController.swift
//  SOeducation
//
//  Created by Robson James Junior on 15/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import UIKit

class TerminalViewController: UIViewController, UITextFieldDelegate {
    
    var clickBool: Bool = false
    var command: String = ""
    var logCommand: [String] = []
    var operationComand: String = ""
    var canAswer: Bool = false
    var auxValue: Int = 0
    var correctAswers: Int = 0
    var totalAswer: Int = 0
    
    @IBOutlet weak var TextTerminal: UILabel!
    
    @IBOutlet weak var textFieldCommand: UITextField!
    
    @IBOutlet weak var BackGroundTerminal: UIView!
    
    
    @IBOutlet weak var ruleLayoutTxtF: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
       // TextTerminal.font = UIFont(name: "SimplePixel.tff", size: 24)
        BackGroundTerminal.backgroundColor = backGroundTerminalColor
        TextTerminal.text = "BitDev:// Digite o comando"
        textFieldCommand.delegate = self
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func keyBoardWillShow(notification: Notification){
        if let userInfo = notification.userInfo as? Dictionary<String, AnyObject>{
            let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
            let keyBoardRect = frame?.cgRectValue
            if let keyBoardHeight = keyBoardRect?.height {
                self.ruleLayoutTxtF.constant = keyBoardHeight
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    @objc func keyBoardWillHide(notification: Notification){
        
        self.ruleLayoutTxtF.constant = 60.0
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
   
    
    
    @IBAction func commandSend(_ sender: Any) {
        if clickBool == false {
            clickBool = true
            let command = textFieldCommand.text!
            textFieldCommand.text = ""
            logCommand.append(command)
            _ = commandAnalisys(cmd: command)
            imprimirLog(ArrayLog: logCommand)
            operationValidation()
        } else {
            if canAswer == true {
                if totalAswer >= 10 {
                    print("entrou")
                    let mensage = " ------- Fim de teste -------"
                    logCommand.append(mensage)
                    let resultTestString = "\(correctAswers)/\(10)"
                    logCommand.append(resultTestString)
                    imprimirLog(ArrayLog: logCommand)
                    clickBool = false
                    correctAswers = 0
                    totalAswer = 0
                    operationComand = ""
                } else {
                   
                    let command = textFieldCommand.text!
                    textFieldCommand.text = ""
                    logCommand.append(command)
                    imprimirLog(ArrayLog: logCommand)
                    if Int(command) == auxValue {
                        correctAswers += 1
                    } else if (command == "cancel"){
                        let cancelOperation = " ------- Operação cancelada -------"
                        logCommand.append(cancelOperation)
                        imprimirLog(ArrayLog: logCommand)
                        clickBool = false
                        correctAswers = 0
                        totalAswer = 0
                        operationComand = ""
                    }
                    totalAswer += 1
                    if totalAswer < 10 {
                        operationValidation()
                    } else {
                        let mss = "Clique OK para ver o resultado"
                        logCommand.append(mss)
                        imprimirLog(ArrayLog: logCommand)
                    }
                }
            }
        }
    }
    
    func operationValidation(){
        switch operationComand {
        case "+":
            let sumControl = somaMath()
            logCommand.append(sumControl.0)
            auxValue = sumControl.1
            imprimirLog(ArrayLog: logCommand)
        case "-":
            let subControl = subMath()
            logCommand.append(subControl.0)
            auxValue = subControl.1
            imprimirLog(ArrayLog: logCommand)
        case "/":
            let divControl = divMath()
            logCommand.append(divControl.0)
            auxValue = divControl.1
            imprimirLog(ArrayLog: logCommand)
        case "*":
            let multControl = multMath()
            logCommand.append(multControl.0)
            auxValue = multControl.1
            imprimirLog(ArrayLog: logCommand)
        default:
            clickBool = false
        }
    }
    
    
    func somaMath() -> (String, Int) {
        canAswer = true
        let numberA = Int.random(in: 0 ..< 100)
        let numberB = Int.random(in: 0 ..< 10)
        
        let result = numberA + numberB
        let question = " \(numberA) + \(numberB)"
        return (question, result)
    }
    
    func multMath() -> (String, Int) {
        canAswer = true
        let numberA = Int.random(in: 0 ..< 100)
        let numberB = Int.random(in: 0 ..< 10)
        
        let result = numberA * numberB
        let question = " \(numberA) x \(numberB)"
        return (question, result)
    }
    
    func divMath() -> (String, Int) {
        canAswer = true
        let numberA = Int.random(in: 0 ..< 100)
        let numberB = Int.random(in: 0 ..< 10)
        
        let result = numberA / numberB
        let question = " \(numberA) / \(numberB)"
        return (question, result)
    }
    
    func subMath() -> (String, Int) {
        canAswer = true
        let numberA = Int.random(in: 0 ..< 100)
        let numberB = Int.random(in: 0 ..< 10)
        
        let result = numberA - numberB
        let question = " \(numberA) - \(numberB)"
        return (question, result)
    }
    
    func imprimirLog (ArrayLog: [String]) {
        TextTerminal.text = ""
        for cmd in ArrayLog {
            TextTerminal.text! += ("\n BitDev:// \(cmd)")
        }
    }
    
    func commandAnalisys(cmd: String){
        switch cmd {
        case "Test.Math(+)":
            operationComand = "+"
        case "Test.Math(-)":
            operationComand = "-"
        case "Test.Math(/)":
            operationComand = "/"
        case "Test.Math(*)":
            operationComand = "*"
        case "clear":
            logCommand.removeAll()
            imprimirLog(ArrayLog: logCommand)
            clickBool = false
        case "":
            clickBool = false
        default:
            clickBool = false
            logCommand.append(" Comando não reconhecido")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
