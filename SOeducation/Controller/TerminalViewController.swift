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
    var auxValueP: String = ""
    var auxValueR: String = ""
    var robotProgram: Bool = false
    
    
    
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
                    if robotProgram == true {
                        print("entrou")
                        let command = textFieldCommand.text!
                        textFieldCommand.text = ""
                        logCommand.append(command)
                        imprimirLog(ArrayLog: logCommand)
                        print(command)
                        if command == auxValueP || command == auxValueR{
                            correctAswers += 1
                            print("acertou")
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
        case "program":
            let programControl = questionProgram()
            logCommand.append(programControl.0)
            auxValueP = programControl.1
            imprimirLog(ArrayLog: logCommand)
        case "robot":
             let robotControl = questionRobot()
             logCommand.append(robotControl.0)
             auxValueR = robotControl.1
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
    
    func questionRobot() -> (String, String) {
        canAswer = true
        let question = robot.keys.randomElement()
        let result = robot["\(question!)"]
        return (question!, result!)
    }
    
    func questionProgram() -> (String, String) {
        canAswer = true
        let question = program.keys.randomElement()
        let result = program["\(question!)"]
        return (question!, result!)
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
        case "Test.Robot()":
            robotProgram = true
            operationComand = "robot"
        case "Test.Program()":
            robotProgram = true
            operationComand = "program"
        case "clear":
            logCommand.removeAll()
            imprimirLog(ArrayLog: logCommand)
            clickBool = false
        case "open PaintDev":
             performSegue(withIdentifier: "TerminalForPaint", sender: nil)
        case "exit":
            performSegue(withIdentifier: "exitTerm", sender: nil)
        case "PaintDev = Mockup":
            haveBackGroundForStud = "Mockup"
            let mss = "Tema instalado"
            logCommand.append(mss)
            imprimirLog(ArrayLog: logCommand)
        case "PaintDev = Math":
            haveBackGroundForStud = "Math"
            let mss = "Tema instalado"
            logCommand.append(mss)
            imprimirLog(ArrayLog: logCommand)
        case "PaintDev = Logic":
            haveBackGroundForStud = "Logic"
            let mss = "Tema instalado"
            logCommand.append(mss)
            imprimirLog(ArrayLog: logCommand)
        case "PaintDev = !":
            let mss = "Modo Livre instalado"
            logCommand.append(mss)
            imprimirLog(ArrayLog: logCommand)
            haveBackGroundForStud = ""
        case "":
            clickBool = false
        default:
            clickBool = false
            logCommand.append(" Comando não reconhecido")
        }
    }
    
    
    @IBAction func helpForCommands(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChild(vc)
        self.view.addSubview(vc.view)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

//let A = robot.keys.randomElement()
//
//robot["\(A!)"]
