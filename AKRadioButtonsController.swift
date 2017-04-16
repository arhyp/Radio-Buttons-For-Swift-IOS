//
//  RadioButtonsController.swift
//  SAL_IOS
//
//  Created by Архип on 3/22/17.
//  Copyright © 2017 ArkhypKoshel. All rights reserved.
//

import UIKit
class AKRadioButton: UIButton {
    var _imageView: UIImageView?
    var cornerRadiusOfImage: CGFloat?  = nil
    
    func set_Image (image: UIImage){
        
        
        if _imageView == nil {
            let frame = CGRect(x: 0 , y: self.frame.height / 2.0 - image.size.height / 2.0, width: image.size.width, height: image.size.height)
            
            self._imageView = UIImageView(image: image)
            self._imageView?.frame = frame
            self.addSubview(_imageView!)
            
            
            if cornerRadiusOfImage == nil {

            self._imageView?.layer.cornerRadius = min(image.size.width,image.size.height ) / 2.0
            }
            else {
                self._imageView?.layer.cornerRadius = self.cornerRadiusOfImage!
            }
            
            self._imageView?.clipsToBounds = true
            
            //move text right
            self.titleEdgeInsets = UIEdgeInsetsMake(0.0, self._imageView!.bounds.width + 10 , 0.0, 0.0)
        }
        self._imageView?.image = image
        self._imageView?.layer.contentsScale = UIScreen.main.scale
        self.contentHorizontalAlignment = .left
        self.contentVerticalAlignment = .center
        
        
        
    }
}
protocol AKRadioButtonsControllerDelegate {
    func selectedButton(sender: AKRadioButton);
}
class AKRadioButtonsController: NSObject {
    var delegate : AKRadioButtonsControllerDelegate?
    var radioButtons: [AKRadioButton]!
    var startGradColorForSelected : UIColor = UIColor(red: 29/255, green: 199/255, blue: 160/255, alpha: 1.0) {
    didSet {
    self.redrawButtons()
    }
    }
    var endGradColorForSelected : UIColor = UIColor(red: 25/255, green: 169/255, blue: 135/255, alpha: 1.0) {
        didSet {
            self.redrawButtons()
        }
    }
    var startPointOfGradColor: CGPoint = CGPoint.zero {
        didSet {
            self.redrawButtons()
        }
    }
    var endPointOfGradColor: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            self.redrawButtons()
        }
    }
    var strokeColor: UIColor = UIColor.lightGray {
        didSet {
            self.redrawButtons()
        }
    }
    var radioSize: Int = 7 {
        didSet {
            self.redrawButtons()
        }
    }
    
    var selectedIndex: Int = 0 {
        didSet{
            self.redrawButtons()
        }
    }
    var selectedImage: UIImage? = nil {
        didSet {
            self.redrawButtons()
        }
    }
    var standartImage: UIImage? = nil  {
        didSet {
            self.redrawButtons()
        }
    }
    
    
     init(radioButtons : [AKRadioButton]) {
       super.init()
        
        self.radioButtons = radioButtons
        for (index, button) in self.radioButtons.enumerated() {
            button.tag = index
            button.addTarget(self, action: #selector(AKRadioButtonsController.select(sender:)), for: .touchUpInside)
            //button.setTitleColor(UIColor .black, for: UIControlState.normal)
            //button.setTitleColor(UIColor .gray, for: UIControlState.highlighted)
        }
        redrawButtons()
    }
    func select(sender: AKRadioButton ){
        selectedIndex = sender.tag
        delegate?.selectedButton(sender: sender)
        redrawButtons()
            }
   private func redrawButtons(){
            for butt in radioButtons{
                
           let Pi = CGFloat.pi
                let sizeOfImage = self.radioSize
        let size = CGSize(width: sizeOfImage, height: sizeOfImage)
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
                if selectedIndex != butt.tag {
                    if (self.standartImage == nil) {
                    let center = CGPoint(x: size.width/2, y: size.height/2);
                    let radius: CGFloat = max(size.width, size.height)
                    let arcWidth: CGFloat = 0.5;
                    let startAngle: CGFloat = 0;
                    let endAngle: CGFloat = 2.0 * Pi ;
                    
                    let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth, startAngle: startAngle, endAngle: endAngle, clockwise: true);
                    
                    path.lineWidth = arcWidth;
                    UIColor.lightGray.setStroke()
                    path.stroke();
                    } else {
                        let context = UIGraphicsGetCurrentContext()
                        if context != nil
                        {
                            context!.draw((self.standartImage?.cgImage)!, in: rect)
                        
                        }
                        
                    }
                    
                }else {
                    if (selectedImage == nil) {
                    let startColor = self.startGradColorForSelected
                    let endColor = self.endGradColorForSelected
                    
                    let colors = [startColor.cgColor, endColor.cgColor]
                    
                    let colorSpace = CGColorSpaceCreateDeviceRGB()
                    
                    let colorLocation : [CGFloat] = [0.0, 1.0];
                    
                    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocation)
                    let startPoint = self.startPointOfGradColor//CGPoint.zero
                    let endPoint = self.endPointOfGradColor//CGPoint(x: 0, y: size.height)
                    
                    UIGraphicsGetCurrentContext()?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: .drawsAfterEndLocation)
                    
                    }else {
                    
                        let context = UIGraphicsGetCurrentContext()
                        if context != nil
                        {
                            context!.draw((self.selectedImage!.cgImage)!, in: rect)
                            context?.scaleBy(x: 1, y: -1)
                            
                            
                        }
                        
                    
                    }
                }
                
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return  }
                let uiImage = UIImage(cgImage: cgImage)//.fixImageOrientation()!
            
           butt.set_Image(image: uiImage)
        }
    }
    
    
}
