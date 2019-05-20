//
//  resourceDesign.swift
//  SOeducation
//
//  Created by Robson James Junior on 15/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import Foundation
import UIKit

let backGroundMenuColor = #colorLiteral(red: 0.9816325307, green: 0.7809638381, blue: 0.2866430879, alpha: 1)
let backGroundDesktopColor = #colorLiteral(red: 0.4604061842, green: 0.5325395465, blue: 0.5909550786, alpha: 1)
let backGroundTerminalColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)


let devLogo: UIImage? = UIImage(named: "DevLogo2")
let onGame: UIImage? = UIImage(named: "OnGame")
let playerDesk: UIImage? = UIImage(named: "ScenePlayer2")

//Images for Slider

let sldMaxImgR: UIImage? = UIImage(named: "maximunPointR")
let sldMaxImgG: UIImage? = UIImage(named: "maximunPointG")
let sldMaxImgB: UIImage? = UIImage(named: "maximunPointB")
let sldMaxImgY: UIImage? = UIImage(named: "maximunPointY")
let sldMaxImgBlack: UIImage? = UIImage(named: "maximunPoint")
let sldMinImgR: UIImage? = UIImage(named: "minimunPointR")
let sldMinImgG: UIImage? = UIImage(named: "minimunPointG")
let sldMinImgB: UIImage? = UIImage(named: "minimunPointB")
let sldMinImgY: UIImage? = UIImage(named: "minimunPointY")
let sldMinImgBlack: UIImage? = UIImage(named: "minimunPoint")

// Images for pallete

let yellowBtSelect: UIImage? = UIImage(named: "selectYellow")
let redBtSelect: UIImage? = UIImage(named: "selectRed")
let greenBtSelect: UIImage? = UIImage(named: "selectGreen")
let blueBtSelect: UIImage? = UIImage(named: "selectBlue")
let blackBtSelect: UIImage? = UIImage(named: "selectBlack")

let yellowBtUnSelect: UIImage? = UIImage(named: "Yellow")
let redBtUnSelect: UIImage? = UIImage(named: "Red")
let greenBtUnSelect: UIImage? = UIImage(named: "Green")
let blueBtUnSelect: UIImage? = UIImage(named: "Blue")
let blackBtUnSelect: UIImage? = UIImage(named: "Black")

// comandos do terminal


let commandsTerminal = "Bem-vindo ao Terminal, Os comandos necessários para você trabalhar nessa interface são: \n \n 1) Para testes de matemática da operação soma \n \t \t Test.Math(+) \n \n 2) Para testes de matemática da operação subtração \n  \t \t Test.Math(-) \n \n 3) Para testes de matemática da operação multiplicação \n  \t \t Test.Math(*) \n \n 4) Para testes de matemática da operação divisão \n \t \t Test.Math(/) \n \n 5) Para apagar seu histórico de comandos digite: \n \t \t clear \n \n 6) Para cancelar uma operação sem finalizá-la digite: \n \t \t cancel \n \n 7) Caso queira abrir o programa do Paint digite: \n \t \t open PaintDev \n \n 8) Caso sair do terminal digite: \n \t \t exit \n \n 9) Caso queira questões de Programação: \n \t \t Test.Robot() \n \n 10) Caso queira questões de Robótica: \n \t \t Test.Program() \n \n 11) Caso queira o tema de aula de Mockup no PaintDev: \n \t \t PaintDev = Mockup \n \n 12) Caso queira o tema de aula de Matemática no PaintDev: \n \t \t PaintDev = Math \n \n 13) Caso queira o tema de aula de Lógica de Algoritmos no PaintDev: \n \t \t PaintDev = Logic \n \n 14) Caso queira o tema de aula Livre no PaintDev: \n \t \t PaintDev = ! \n \n"


// image for backGround

let imageGameForStud: UIImage? = nil

var haveBackGroundForStud: String = ""

//Arrays Pictures

let m1 = UIImage.init(named: "M1")
let m2 = UIImage.init(named: "M2")
let m3 = UIImage.init(named: "M3")
let m4 = UIImage.init(named: "SketchForApp")

let mockupArrayImagesMK: [UIImage] = [m1!, m2!, m3!, m4!]

let mat1 = UIImage.init(named: "mat1")
let mat2 = UIImage.init(named: "mat2")
let mat3 = UIImage.init(named: "mat3")
let mat4 = UIImage.init(named: "mat4")
let mat6 = UIImage.init(named: "mat6")

let mathArrayImagesMT: [UIImage] = [mat1!, mat2!, mat3!, mat4!,  mat6!]

let log1 = UIImage.init(named: "lg1")
let log2 = UIImage.init(named: "lg2")
let log3 = UIImage.init(named: "lg3")
let log4 = UIImage.init(named: "lg4")

let logArrayImagesLG: [UIImage] = [log1!, log2!, log3!, log4!]


// Array de questões de programação e robótica

let program = ["Um algoritmo é um programa que recebe dados que precisam ser armazenados no computador para serem utilizados no processamento": "F", "Em lógica de programação, existe um artifício que, geralmente, economiza linhas de código com uma solução elegante e eficaz de reuso do código, o qual faz uma chamada a si mesmo. Este artifício algorítmico é denominado de Recursividade.": "V", "Lógica de programação é o modo como se escreve um programa de computador. Um algoritmo é uma sequência de passos para se executar uma função.": "V", "O banco de dados pode ser denominado um conjunto finito de passos formalmente definidos de modo a apresentar a solução para um problema.": "F", "O comando A = 28 atribui à variável A o valor 28. ": "V", "No que se refere à construção de algoritmos, Os valores “sim”, “não”, “falso” e “verdadeiro” são considerados variáveis  lógicas .": "F"]

let robot = ["Sensores analógicos são sensores que ao invés de transmitir sinal binário (1 ou 0), transmite uma medida que é verificada pela tensão de correntevoltagem que chega no microcontrolador, deste modo podemos verificar, por exemplo, intensidades diferentes de luz.": "V", "O sinal digital ocorre através de uma lógica Booleana ou lógica Binária (Sim ou Não, Verdadeiro ou Falso, 1 ou 0), ou seja, ele envia um sinal para o microcontrolador dizendo se é Sim(Verdadeiro, 1) ou Não (Falso, 0)": "V", "Na robótica, os sensores são de extrema importância, pois são responsáveis por transformar todas as informações no ambiente que cerca o robô em informações digitais.":"V","A robótica é a ciência que estuda a construção de robôs. É um ramo da tecnologia que envolve Engenharia Mecânica, Engenharia Elétrica, Engenharia Eletrônica e Engenharia da Computação.": "V", "A idéia de construir robôs começou no início do século XX com Alan Turing, o pai da Robótica Industrial, que através de grande inovação, proporcionou a introdução de robôs nas fábricas.": "F", " os rotacionais por exemplo “Servo Motor” são  atuadores diferente dos geradores, que ao invés de produzir energia cinética, utilizam energia elétrica para a emissão visual, sonora, calórica e magnética.": "F","Os Emissores são os atuadores diferente dos geradores, que ao invés de produzir energia cinética, utilizam energia elétrica para a emissão visual, sonora, calórica e magnética.": "V", " Buzzer e Leds são exemplos de atuadores do tipo Emissores.": "V","O  módulo é a Mecânica que tem extrema importância, pois é a área responsável pelo conjunto estrutural e pelo conjunto de movimento, ou seja, através da mecânica é possível fazer que o robô tenha esqueleto e seja capaz assim de movimentar":"V", "os atuadores são os componentes que consomem energia elétrica da fonte ou das pilhas para realizar uma ação.": "V"]
