//
//  ViewController.swift
//  CourtLabel
//
//  Created by Ronny Hendrickx on 10/16/15.
//  Copyright © 2015 Ronny Hendrickx. All rights reserved.
//

import UIKit
import GameplayKit
import iAd


class ViewController: UIViewController, ADBannerViewDelegate {
    
    // MARK: Outlets
    
    @IBOutlet weak var defaultStepper: UIStepper!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var assignButton: UIButton!
    
    @IBOutlet weak var banner: ADBannerView!
    
    // MARK: Actions
    
    @IBAction func valueDidChange(sender: UIStepper) {
        label.text = "\(Int(sender.value))"
        
    }
    
    // MARK: Main
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureStepper()
        configureButton()
        
        // banner code
        banner.hidden = true
        banner.delegate = self
        self.canDisplayBannerAds = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: custom functions
    
    
    func configureStepper(){
        defaultStepper.value = 1
        defaultStepper.addTarget(self, action: "valueDidChange:", forControlEvents: .ValueChanged)
        label.text = "\(Int(defaultStepper.value))"
    }
    
    func configureButton(){
        assignButton.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)
    }
    
    func buttonAction(sender: UIButton) {
        
        setPlayers(Int(defaultStepper.value))
    }
    
    func setPlayers(counter: Int){
        
        let count = counter
        var players = [Int] (1...count)
        players = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(players) as! [Int]
        var playersCounter = players.count
        if playersCounter < 16 { playersCounter = 16}
        
        
        for i in 0..<playersCounter {
            
            if let theLabel = self.view.viewWithTag(i+1) as? UILabel {
                if i < players.count {
                    theLabel.text = (String)(players[i])
                } else {
                    theLabel.text = ""
                }
            }
            
            
        }
        
    }
    
    // MARK: ad banner functions
    
/*    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
        
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        banner.hidden = false
        
    }
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("Error loading banner!")
        
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        
    }
*/
}

