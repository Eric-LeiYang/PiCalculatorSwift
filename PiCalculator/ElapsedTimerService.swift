//
//  ElapsedTimerService.swift
//  PiCalculator
//
//  Created by EricYang on 5/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

import Foundation

protocol ElapsedTimerServiceDelegate {
    func elapsedTimerDidUpdate(piCalculatorModel: PiCalculatorModel)
}

class ElapsedTimerService{
    
    //MARK: constants
    private let timeIncrement: Double = 0.01
    private let emptyDouble: Double = 0.0

    //MARK: properties
    var timer: NSTimer?
    var delegate: ElapsedTimerServiceDelegate?
    var timeElapsed: Double
    
    private let piCalculateService: PiCalculateService
    private var piCalculatorModel: PiCalculatorModel
    
    //MARK: init
    init(){
        timer = nil
        delegate = nil
        timeElapsed = emptyDouble
        piCalculateService = PiCalculateService()
        piCalculatorModel = PiCalculatorModel(Pi:emptyDouble, elapsedTime:emptyDouble)
    }
    
    //MARK: public
    
    func start() {
        //Pi calculator
        piCalculateService.start()
        
        //timer
        timeElapsed = emptyDouble;//start from 0
        timer = NSTimer.scheduledTimerWithTimeInterval(timeIncrement, target:self, selector:"updateTimer", userInfo: nil, repeats: true)
    }
    
    func pause(){
        //Pi calculator
        piCalculateService.pause()
        
        timer?.invalidate()
        timer = nil
    }

    func stop(){
        //Pi calculator
        piCalculateService.stop()
        
        timeElapsed = emptyDouble //clean the elapsed time
        timer?.invalidate()
        timer = nil
    }
    
    func resume(){
        //Pi calculator
        piCalculateService.resume()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(timeIncrement, target:self, selector:"updateTimer", userInfo: nil, repeats: true)
    }
    
    @objc
    func updateTimer(){
        //elapsed time
        timeElapsed = timeElapsed + timeIncrement
        
        //model
        piCalculatorModel.Pi =  piCalculateService.PiAlgorithm()
        piCalculatorModel.elapsedTime = timeElapsed
        
        delegate?.elapsedTimerDidUpdate(piCalculatorModel)
    }
    
}