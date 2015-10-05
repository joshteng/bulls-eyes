//
//  ViewController.swift
//  BullsEye
//
//  Created by Josh Teng on 10/2/15.
//  Copyright (c) 2015 Josh Teng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var slider: UISlider! //this is actually an instance variable but because it's tied to a UIKit object, it's called an outlet
  @IBOutlet weak var targetLabel: UILabel!
  
  var currentValue: Int = 0;
  var targetValue: Int = 0;
  var differenceValue: Int = 0;
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    startNewRound()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //methods prepended with @IBAction is called an action method while methods with just func is a normal methods
  
  @IBAction func showAlert() {
    calculateDifferenceFromTarget()
    
    let message = "The value of the slider is \(currentValue)\n The target value is \(targetValue) \n You are \(differenceValue) off from your target"
  
    let alert = UIAlertController(title: "Hello, World",
        message: message, preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
    
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
    
    startNewRound()
  }
  
  @IBAction func sliderMoved(slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  func startNewRound() {
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
    updateTargetLabel()
  }
  
  func updateTargetLabel() {
    targetLabel.text = String(targetValue)
  }
  
  func calculateDifferenceFromTarget() {
    differenceValue = targetValue - currentValue
  }

}

