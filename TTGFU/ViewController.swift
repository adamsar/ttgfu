//
//  ViewController.swift
//  TTGFU
//
//  Created by Andrew Adams on 2/11/17.
//  Copyright © 2017 Andrew Adams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockBackground: UIImageView!
    @IBOutlet weak var minuteHand: UIImageView!
    
    var timer: Timer?;
    var hourHand: TriangleView?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.hourHand = TriangleView(frame: CGRect(x: clockBackground!.center.x - 10, y: clockBackground!.center.y - 50, width: 20 , height: 100))
        self.hourHand!.backgroundColor = .clear
        view.addSubview(hourHand!)
        self.timer = Timer.scheduledTimer(timeInterval: 60,
                                          target: self,
                                          selector: #selector(ViewController.repositionClock),
                                          userInfo: nil,
                                          repeats: true)
        self.repositionClock()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setRotationAmount(view: UIView, percent: CGFloat) {
        view.transform = CGAffineTransform(rotationAngle: percent * CGFloat.pi * 2.0)
    }
    
    private func getCurrentDate() -> DateComponents {
        let calendar = Calendar.current
        let currentDate = Date()
        return (calendar as NSCalendar).components([NSCalendar.Unit.hour, NSCalendar.Unit.minute], from: currentDate)
    }
    
    func repositionClock() {
        let dateComponents = getCurrentDate()
        let minutes = dateComponents.minute
        let hours = dateComponents.hour
        
        let minutePercent = CGFloat(CGFloat(minutes!) / 60.0)
        setRotationAmount(view: minuteHand!,
                          percent: minutePercent)
        setRotationAmount(view: hourHand!,
                          percent: CGFloat((CGFloat(hours! % 12) + minutePercent) / 12.0))

    }


}

