//
//  ObservablaObject.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 7/3/23.
//

import Foundation

final class ObservableObject<T> {
    
    //  ObservableObject Value
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    //  Listener clouser
    private var listener: ((T?) -> ())?
    
    init(_ value: T?) {
        self.value = value
    }
    
    //  Bind Method
    func bind(_ listener: @escaping (T?) -> Void) {
        self.listener = listener
        listener(value)
    }
}
