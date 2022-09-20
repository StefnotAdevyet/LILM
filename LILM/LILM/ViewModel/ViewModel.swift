//
//  ViewModel.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation
import Combine

protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State
    associatedtype Input
    
    var state: State { get }
    func trigger(_ input: Input)
}
