//
//  ViewController.swift
//  PiCalculator
//
//  Created by EricYang on 5/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

import UIKit

enum CalculatorStatus{
    case Started
    case Stopped
    case Paused
    case Resumed
}

class ViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var PiLabel: UILabel!
    @IBOutlet weak var elapsedLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var pauseResumeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModel = PiCalculatorViewModel()
        
        //update UI status
        updateUIbyStatus(.Stopped)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: updateUI
    private func updateUIbyStatus(status:CalculatorStatus){
        
        switch status{
            
        case .Started:
            self.startStopButton.setTitle("Stop", forState: UIControlState.Normal)
            self.pauseResumeButton.enabled = true
            self.pauseResumeButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            
        case .Paused:
            self.pauseResumeButton.setTitle("Resume", forState: UIControlState.Normal)
            
        case .Resumed:
            self.pauseResumeButton.setTitle("Pause", forState: UIControlState.Normal)
            
        case .Stopped:
            self.startStopButton.setTitle("Start", forState: UIControlState.Normal)
            self.pauseResumeButton.enabled = false
            self.pauseResumeButton.setTitle("Pause", forState: UIControlState.Normal)
            self.pauseResumeButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            
        }
    }
    
    // MARK: ViewModel
    var viewModel: PiCalculatorViewModel? {
        didSet {
            viewModel?.elapsedTime.observe {
                [unowned self] in
                self.elapsedLabel.text = $0
            }
            viewModel?.Pi.observe{
                [unowned self] in
                self.PiLabel.text = $0
            }
        }
    }
    
    //MARK: button action
    @IBAction func startStopButton(sender: UIButton) {
        if("Start" == sender.titleLabel!.text){
            updateUIbyStatus(.Started)
            viewModel?.startCalculator()
        }else{
            updateUIbyStatus(.Stopped)
            viewModel?.stopCalculator()
        }
    }
        
        
    @IBAction func PauseResumeButton(sender: UIButton) {
        if("Pause" == sender.titleLabel!.text){
            updateUIbyStatus(.Paused)
            viewModel?.pauseCalculator()
        }else{
            updateUIbyStatus(.Resumed)
            viewModel?.resumeCalculator()
        }
    
    }
}

