//
//  AnyViewModel.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation

final class AnyViewModel<State, Input>: ViewModel {
    
    //Stored Properties
    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
    private let wrappedState: () -> State
    private let wrappedTrigger: (Input) -> Void
    
    
    //Computed Properties
    var objectWillChange: AnyPublisher<Void, Never> {
        wrappedObjectWillChange()
    }
    
    var state: State {
        wrappedState()
    }
    
    //Methods
    func trigger(_ input: Input) {
        wrappedTrigger(input)
    }
    
    subscript<Value>(dynamicMember keypath: KeyPath<State, Value>) -> Value {
        state[keyPath: keypath]
    }
    
    //Initialization
    init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Input == Input {
        self.wrappedObjectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
        self.wrappedState = { viewModel.state }
        self.wrappedTrigger = viewModel.trigger
    }
}
