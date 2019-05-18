//
//  PaintViewController.swift
//  SOeducation
//
//  Created by Robson James Junior on 18/05/19.
//  Copyright © 2019 Academy. All rights reserved.
//

import UIKit

class PaintViewController: UIViewController {
    
    
    @IBOutlet weak var sliderPointSize: UISlider!
    
    
    @IBOutlet weak var backGroundImage: UIImageView!
    
    
    @IBOutlet weak var canvasView: CanvasView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func deletePaintDrawn(_ sender: Any) {
        canvasView.clearCanvas()
    }
    
    
    @IBAction func colorChangeForYellow(_ sender: Any) {
    }
    
    @IBAction func colorChangeForRed(_ sender: Any) {
    }
    
    
    @IBAction func colorChangeForGreen(_ sender: Any) {
    }
    
    
    @IBAction func colorChangeForBlue(_ sender: Any) {
    }
    
    
    
    @IBAction func colorChangeForBlack(_ sender: Any) {
    }
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
}
