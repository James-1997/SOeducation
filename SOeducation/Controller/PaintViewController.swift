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
    
    @IBOutlet weak var blackImageBt: UIButton!
    
    @IBOutlet weak var yellowImageBt: UIButton!
    
    @IBOutlet weak var redImageBt: UIButton!
    
    @IBOutlet weak var greenImageBt: UIButton!
    
    @IBOutlet weak var blueImageBt: UIButton!
    
    @IBOutlet weak var selectedPincelColor: UIImageView!
   
    
    @IBOutlet weak var setChangeImage: UIButton!
    
    var indexArr: Int = 0
    var limit: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sliderPointSize.value = Float(sizePointUser)
        sliderPointSize.minimumTrackTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        colorUserSelect = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sliderPointSize.maximumValueImage = sldMinImgBlack
        sliderPointSize.minimumValueImage = sldMaxImgBlack
        selectedPincelColor.image = blackBtSelect
        verifiqBackGroundTheme()
    }
    
    
    @IBAction func deletePaintDrawn(_ sender: Any) {
        canvasView.clearCanvas()
        
    }
    
    
    @IBAction func colorChangeForYellow(_ sender: UIButton) {
      
        colorUserSelect = #colorLiteral(red: 1, green: 0.9681953788, blue: 0, alpha: 1)
        sliderPointSize.minimumTrackTintColor = #colorLiteral(red: 1, green: 0.9681953788, blue: 0, alpha: 1)
        sliderPointSize.maximumValueImage = sldMinImgY
        sliderPointSize.minimumValueImage = sldMaxImgY
        
        selectedPincelColor.image = yellowBtSelect
     
    }
    
    @IBAction func colorChangeForRed(_ sender: Any) {
        colorUserSelect = #colorLiteral(red: 0.9990847707, green: 0.2392956018, blue: 0, alpha: 1)
        sliderPointSize.minimumTrackTintColor = #colorLiteral(red: 0.9990847707, green: 0.2392956018, blue: 0, alpha: 1)
        sliderPointSize.maximumValueImage = sldMinImgR
        sliderPointSize.minimumValueImage = sldMaxImgR
        selectedPincelColor.image = redBtSelect
     
    }
    
    
    @IBAction func colorChangeForGreen(_ sender: Any) {
        colorUserSelect = #colorLiteral(red: 0.2976710796, green: 0.6878548265, blue: 0.3155451417, alpha: 1)
        sliderPointSize.minimumTrackTintColor = #colorLiteral(red: 0.2976710796, green: 0.6878548265, blue: 0.3155451417, alpha: 1)
        sliderPointSize.maximumValueImage = sldMinImgG
        sliderPointSize.minimumValueImage = sldMaxImgG
        selectedPincelColor.image = greenBtSelect
    }
    
    
    @IBAction func colorChangeForBlue(_ sender: Any) {
        colorUserSelect = #colorLiteral(red: 0.1322169602, green: 0.5880987048, blue: 0.9535093904, alpha: 1)
        sliderPointSize.minimumTrackTintColor = #colorLiteral(red: 0.1322169602, green: 0.5880987048, blue: 0.9535093904, alpha: 1)
        sliderPointSize.maximumValueImage = sldMinImgB
        sliderPointSize.minimumValueImage = sldMaxImgB
        selectedPincelColor.image = blueBtSelect

    }
    
    
    
    @IBAction func colorChangeForBlack(_ sender: Any) {
        colorUserSelect = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sliderPointSize.minimumTrackTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sliderPointSize.maximumValueImage = sldMinImgBlack
        sliderPointSize.minimumValueImage = sldMaxImgBlack
        selectedPincelColor.image = blackBtSelect


    }
    
    
    @IBAction func sliderChangeSizePointDrawn(_ sender: Any) {
        
        let value = Int(sliderPointSize.value)
        
        print(value)
        
        sizePointUser = CGFloat(value)
        
    }
    
    
    func verifiqBackGroundTheme(){
        
        switch haveBackGroundForStud {
        case "Mockup":
            setChangeImage.isHidden = false
            limit = mockupArrayImagesMK.count
            backGroundImage.image = mockupArrayImagesMK[indexArr]
        case "Math":
            setChangeImage.isHidden = false
            limit = mathArrayImagesMT.count
            backGroundImage.image = mathArrayImagesMT[indexArr]
        case "Logic":
            setChangeImage.isHidden = false
            limit = logArrayImagesLG.count
            backGroundImage.image = logArrayImagesLG[indexArr]
        default:
            setChangeImage.isHidden = true
            print("vazio")
        }
    }
    
    
    @IBAction func changeImageBackGround(_ sender: Any) {
        if !((indexArr + 1) >= limit) {
            indexArr += 1
            verifiqBackGroundTheme()
        } else {
            indexArr = 0
            verifiqBackGroundTheme()
        }
    }
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    
}
