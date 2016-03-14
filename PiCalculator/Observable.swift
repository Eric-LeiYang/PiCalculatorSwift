//
//  Observable.swift
//  PiCalculator
//
//  Created by EricYang on 5/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

import Foundation

class Observable<T> {
    
    //MARK: Properties
    typealias Observer = T -> Void
    var observer: Observer?
    
    //MARK: overwrite didSet()
    var value: T {
        didSet {
            observer?(value)
        }
    }

    //MARK: init
    init(_ v: T) {
        value = v
    }
    
    //MARK: public
    func observe(observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
}

