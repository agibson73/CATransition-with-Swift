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
        containerView2.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cubeDidPress(sender: AnyObject) {
        
        
        
        if topView == true{
            var animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "alignedCube"
            
            mainContainer.layer.addAnimation(animation, forKey: nil)
            
            self.containerView.hidden = true
            self.containerView2.hidden = false
            topView = false
        }
        else
        {
            var animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "alignedCube"
            mainContainer.layer.addAnimation(animation, forKey: nil)
            
            self.containerView.hidden = false
            self.containerView2.hidden = true
            topView = true
            
        }

    }
    @IBAction func spewEffect(sender: AnyObject) {
        
        
        
        if topView == true{
            var animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "oglFlip"
            
            mainContainer.layer.addAnimation(animation, forKey: nil)
            
            self.containerView.hidden = true
            self.containerView2.hidden = false
            topView = false
        }
        else
        {
            var animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "oglFlip"
            mainContainer.layer.addAnimation(animation, forKey: nil)
            
            self.containerView.hidden = false
            self.containerView2.hidden = true
            topView = true
            
        }

    }
    @IBAction func suckEffectDidPress(sender: UIButton) {
        
        
        if topView == true{
            var animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
         
            animation.type = "suckEffect"
            mainContainer.layer.addAnimation(animation, forKey: nil)
            
            self.containerView.hidden = true
            self.containerView2.hidden = false
            topView = false
        }
        else
        {
            self.containerView.hidden = false
            var animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
       
            animation.type = "suckEffect"
            mainContainer.layer.addAnimation(animation, forKey: nil)
            
            self.containerView.hidden = false
            self.containerView2.hidden = true
            topView = true
            
        }

    }
    @IBAction func flipDidPress(sender: AnyObject) {
        if topView == true{

        // try with container view
        UIView.transitionWithView(self.mainContainer, duration: 0.6, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
            self.containerView.hidden = true
            self.containerView2.hidden = false
            }, completion: {
                finished in
                self.topView = false
        })

        }
        else
        {
            // try with container view
            UIView.transitionWithView(self.mainContainer, duration: 0.6, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
                self.containerView.hidden = false
                self.containerView2.hidden = true
                }, completion: {
                    finished in
                    self.topView = true
            })
            

        }
        
    }

    @IBAction func rippleDidPress(sender: AnyObject) {
        
        
        if topView == true{
            var animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "rippleEffect"
            
            mainContainer.layer.addAnimation(animation, forKey: nil)
            
            self.containerView.hidden = true
            self.containerView2.hidden = false
            topView = false
        }
        else
        {
            var animation = CATransition()
            animation.duration = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = "rippleEffect"
            mainContainer.layer.addAnimation(animation, forKey: nil)
            
            self.containerView.hidden = false
            self.containerView2.hidden = true
            topView = true
            
        }
    }
    
    @IBAction func pageCurlDidPress(sender: AnyObject) {
        
        containerView2.hidden = false
        if topView == true{
            var transition = CATransition()
            transition.duration = 0.6
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = "pageCurl"
            transition.subtype = kCATransitionFromBottom
            transition.fillMode = kCAFillModeForwards
            transition.removedOnCompletion = false
            transition.startProgress = 0
            transition.endProgress = 0.9
            self.mainContainer.layer.addAnimation(transition, forKey: nil)
            topView = false
            pageCurled = true
            self.mainContainer.bringSubviewToFront(containerView2)
        }
        else if pageCurled == true
        {
            var transition = CATransition()
            transition.duration = 0.6
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = "pageUnCurl"
            //transition.subtype = kCATransitionFromTop
            transition.fillMode = kCAFillModeForwards
            transition.removedOnCompletion = true
            transition.startProgress = 0.1
            self.mainContainer.layer.addAnimation(transition, forKey: nil)
            topView = true
            self.mainContainer.sendSubviewToBack(containerView2)
            pageCurled = false
            containerView2.hidden = true
        }
        else
        {
            self.flipDidPress(self)
        
            self.delay(0.6, closure: {
                self.pageCurlDidPress(self)
            })
            
        }
        
             
    }
    

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}

