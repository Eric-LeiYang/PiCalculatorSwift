//
//  PiCalculatorViewModel.swift
//  PiCalculator
//
//  Created by EricYang on 5/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

import Foundation

class PiCalculatorViewModel{
    //MARk: Constants
    private let emptyString: String = "0.00"
    
    //MARK: Properties
    let Pi: Observable<String>
    let elapsedTime: Observable<String>
    
    //MARK: Services
    private let elapsedTimerService: ElapsedTimerService
    
    //MARK: init
    init(){
        Pi = Observable(emptyString)
        elapsedTime = Observable(emptyString)
        elapsedTimerService = ElapsedTimerService()
        elapsedTimerService.delegate = self
    }
    
    //MARK: public
    func startCalculator(){
        elapsedTimerService.start()
    }
    
    func pauseCalculator(){
        elapsedTimerService.pause()
    }
    
    func resumeCalculator(){
        elapsedTimerService.resume()
    }
    
    func stopCalculator(){
        elapsedTimerService.stop()
    }
    
    
    //MARK: private
    private func update(piCalculatorModel:PiCalculatorModel){
        dispatch_async(dispatch_get_main_queue(), {
            self.Pi.value = String(format:"%.25f", piCalculatorModel.Pi)
            self.elapsedTime.value = String(format:"%.2f", piCalculatorModel.elapsedTime)
        })
    }
}

//MARK: ElapsedTimerServiceDelegate
extension PiCalculatorViewModel: ElapsedTimerServiceDelegate{
    func elapsedTimerDidUpdate(piCalculatorModel: PiCalculatorModel) {
        self.update(piCalculatorModel)
    }
}
