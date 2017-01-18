//
// Alex Gibson did this in May 2015.  There is no warranty that this will work. You are free to use this but if there are bugs then it is up to you to fix it for your purposes.  This was an excercise of fun.  Happy Coding
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var containerView: UIView!
    var topView = true
    var pageCurled = false
    
    @IBOutlet weak var view1ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        containerView2.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cubeDidPress(_ sender: AnyObject) {
        
        //have to switch it back if now
        if topView == true{
            let animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "alignedCube"
            
            mainContainer.layer.add(animation, forKey: nil)
            
            self.containerView.isHidden = true
            self.containerView2.isHidden = false
            topView = false
        }else{
            let animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "alignedCube"
            mainContainer.layer.add(animation, forKey: nil)
            
            self.containerView.isHidden = false
            self.containerView2.isHidden = true
            topView = true
            
        }

    }
    @IBAction func spewEffect(_ sender: AnyObject) {
        
        
        
        if topView == true{
            let animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "oglFlip"
            
            mainContainer.layer.add(animation, forKey: nil)
            
            self.containerView.isHidden = true
            self.containerView2.isHidden = false
            topView = false
        }else{
            let animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "oglFlip"
            mainContainer.layer.add(animation, forKey: nil)
            
            self.containerView.isHidden = false
            self.containerView2.isHidden = true
            topView = true
            
        }

    }
    @IBAction func suckEffectDidPress(_ sender: UIButton) {
        
        
        if topView == true{
            let animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
         
            animation.type = "suckEffect"
            mainContainer.layer.add(animation, forKey: nil)
            
            self.containerView.isHidden = true
            self.containerView2.isHidden = false
            topView = false
        }else{
            self.containerView.isHidden = false
            let animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
       
            animation.type = "suckEffect"
            mainContainer.layer.add(animation, forKey: nil)
            
            self.containerView.isHidden = false
            self.containerView2.isHidden = true
            topView = true
            
        }

    }
    @IBAction func flipDidPress(_ sender: AnyObject) {
        if topView == true{

        // try with container view
        UIView.transition(with: self.mainContainer, duration: 0.6, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            self.containerView.isHidden = true
            self.containerView2.isHidden = false
            }, completion: {
                finished in
                self.topView = false
        })

        }else{
            // try with container view
            UIView.transition(with: self.mainContainer, duration: 0.6, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                self.containerView.isHidden = false
                self.containerView2.isHidden = true
                }, completion: {
                    finished in
                    self.topView = true
            })
            

        }
        
    }

    @IBAction func rippleDidPress(_ sender: AnyObject) {
        
        
        if topView == true{
            let animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "rippleEffect"
            
            mainContainer.layer.add(animation, forKey: nil)
            
            self.containerView.isHidden = true
            self.containerView2.isHidden = false
            topView = false
        }else{
            let animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "rippleEffect"
            mainContainer.layer.add(animation, forKey: nil)
            
            self.containerView.isHidden = false
            self.containerView2.isHidden = true
            topView = true
            
        }
    }
    
    @IBAction func pageCurlDidPress(_ sender: AnyObject) {
        
        containerView2.isHidden = false
        if topView == true{
            let transition = CATransition()
            transition.duration = 0.6
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = "pageCurl"
            transition.subtype = kCATransitionFromBottom
            transition.fillMode = kCAFillModeForwards
            transition.isRemovedOnCompletion = false
            transition.startProgress = 0
            transition.endProgress = 0.9
            self.mainContainer.layer.add(transition, forKey: nil)
            topView = false
            pageCurled = true
            self.mainContainer.bringSubview(toFront: containerView2)
        }else if pageCurled == true{
            let transition = CATransition()
            transition.duration = 0.6
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = "pageUnCurl"
            //transition.subtype = kCATransitionFromTop
            transition.fillMode = kCAFillModeForwards
            transition.isRemovedOnCompletion = true
            transition.startProgress = 0.1
            self.mainContainer.layer.add(transition, forKey: nil)
            topView = true
            self.mainContainer.sendSubview(toBack: containerView2)
            pageCurled = false
            containerView2.isHidden = true
        }else{
            self.flipDidPress(self)
            self.delay(0.6, closure: {
                self.pageCurlDidPress(self)
            })
            
        }
        
             
    }
    

    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

}

