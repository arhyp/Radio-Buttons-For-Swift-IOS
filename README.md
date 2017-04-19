# Radio-Buttons-For-Swift-IOS\
radio buttons for ios swift

AKRadioButtonsController is an radio buttons library written in Swift.

## Usage
1 - Create 2 property:
    1. as AKRadioButtonsController
    2. as  [AKRadioButton]
   Also you may add  AKRadioButtonsControllerDelegate protocol (for "func selectedButton(sender: AKRadioButton)" method that invoke evry time when you select new radio button)
```swift
class ViewController: UIViewController, AKRadioButtonsControllerDelegate {
    var radioButtonsController: AKRadioButtonsController!
    @IBOutlet var radioButtons: [AKRadioButton]!
    }
```
You may add buttons through storyboard or manually through code:
![AKRadioButtonsController: Elegant Radio-Buttons in Swift](https://github.com/arhip1995/Radio-Buttons-For-Swift-IOS/blob/master/img0.PNG.png)
![AKRadioButtonsController: Elegant Radio-Buttons in Swift](https://github.com/arhip1995/Radio-Buttons-For-Swift-IOS/blob/master/img1.PNG.png)



2- In  ```swift viewDidLoad() ``` method should be implemented properties wich were mentioned above 

```swift  
override func viewDidLoad() {
        super.viewDidLoad()
        self.radioButtonsController = AKRadioButtonsController(radioButtons: self.radioButtons)
        self.radioButtonsController.delegate = self //class should implement AKRadioButtonsControllerDelegate 
        }
```
        
        
3- Get selected index or button 
  if you implement ```swift AKRadioButtonsControllerDelegate ``` you may use:
```swift
   func selectedButton(sender: AKRadioButton){
        let alert = UIAlertController(title: "Alert!", message: "selected Button: \(sender.title(for: .normal)!)", preferredStyle: UIAlertControllerStyle.alert)
        let dismissAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) -> Void in
        }
        
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
        
    }
```
or you can just use property  ```swift  radioButtonsController.selectedIndex ``` (enumeration from 0 to n)

# Properties for customization :
You can change next properties:
  1) For selected button (gradient color) :
     - startGradColorForSelected: UIColor
     - endGradColorForSelected: UIColor
     - startPointOfGradColor:  CGPoint
     - endPointOfGradColor: CGPoint
  2) For unselected button (border color):
     - strokeColor: UIColor
  3) For radio size: 
     - radioSize: Int
  4) Set selected button : 
     - selectedIndex : Int
  5) If you want use image as radio element: 
     - selectedImage : UIImage?
     - standartImage : UIImage?


Tap on image to see simple the result:
[![IMAGE ALT TEXT HERE](https://github.com/arhip1995/Radio-Buttons-For-Swift-IOS/blob/master/img3.PNG)](https://youtu.be/8ieA3d7sm-g)


Please, let me know if you have any questions or suggestions!
Thank you and enjoy it with pleasure )
