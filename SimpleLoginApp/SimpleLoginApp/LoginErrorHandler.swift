//
//  LoginErrorHandler.swift
//  SimpleLoginApp
//
//  Created by Sravya Kaki on 12/24/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import Foundation

class LoginErrorHandler<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
