//
//  PiCalculateService.swift
//  PiCalculator
//
//  Created by EricYang on 5/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

import Foundation


class PiCalculateService{
    
    //MARK: constants
    private let emptyDouble: Double = 0.0
    private let defaultIterationNumber: Int  = 1 //Iteration Number: 1 by default
    
    //MARK: private
    private var shouldBeStopped: Bool
    private var Pi: Double
    private var iterationNumber: Int
    
    //MARK: init
    init(){
        Pi = emptyDouble
        iterationNumber = defaultIterationNumber
        shouldBeStopped = false
    }
    
    
    //MARK: public
    func start(){
        shouldBeStopped = false
        Pi = emptyDouble
        iterationNumber = defaultIterationNumber
    }
    
    func pause(){
        shouldBeStopped = true
    }
    
    func resume(){
        shouldBeStopped = false
    }
    
    func stop(){
        shouldBeStopped = true
    }
    
    func PiAlgorithm() -> Double{
        
        //if stoped/paused
        if(shouldBeStopped == true){
            return Pi
        }
        
        //using if/else instead of pow() function in Swift
        if(iterationNumber % 2 == 0){ //if the reminder of m/2 is 0
            Pi = Pi + 4.0 * ((-1.0)/((2.0 * Double(iterationNumber))-1.0))
        }else{
            Pi = Pi + 4.0 * ((1.0)/((2.0 *  Double(iterationNumber))-1.0))
        }
        
        //add number
        iterationNumber = iterationNumber + 1
        
        return Pi
    }
}