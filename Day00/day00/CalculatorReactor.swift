//
//  CalculatorReactor.swift
//  ex04
//
//  Created by 지상률 on 4/23/25.
//

import Foundation
import ReactorKit
import RxSwift
import RxCocoa

class CalculatorReactor: Reactor {
    enum Action {
        case tapNumber(Int)
        case tapOperator(String)
        case tapEqual
        case tapAC
        case tapNEG
    }
    
    enum Mutation {
        case setNumber(Int)
        case setOperator(String)
        case calculate
        case clear
        case negate
    }
    
    // 계산기 상태 정의
    struct State {
        var displayText: String = "0"
        var currentNumber: String = "0"
        var storedNumber: Double?
        var currentOperator: String?
        var shouldResetCurrentNumber: Bool = false
    }
    
    let initialState = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .tapNumber(let number):
            return .just(.setNumber(number))
            
        case .tapOperator(let operatorSymbol):
            return .just(.setOperator(operatorSymbol))
            
        case .tapEqual:
            return .just(.calculate)
            
        case .tapAC:
            return .just(.clear)
            
        case .tapNEG:
            return .just(.negate)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        switch mutation {
        case .setNumber(let number):
            if state.shouldResetCurrentNumber {
                newState.currentNumber = "\(number)"
                newState.shouldResetCurrentNumber = false
            } else {
                if state.currentNumber == "0" {
                    newState.currentNumber = "\(number)"
                } else {
                    newState.currentNumber += "\(number)"
                }
            }
            newState.displayText = newState.currentNumber
            
        case .setOperator(let operatorSymbol):
            if let current = Double(state.currentNumber) {
                if let storedNumber = state.storedNumber, let currentOperator = state.currentOperator {
                    let result = calculate(storedNumber, current, currentOperator)
                    newState.storedNumber = result
                    newState.displayText = formatResult(result)
                } else {
                    newState.storedNumber = current
                }
            }
            newState.currentOperator = operatorSymbol
            newState.shouldResetCurrentNumber = true
            
        case .calculate:
            if let storedNumber = state.storedNumber,
               let currentOperator = state.currentOperator,
               let currentNumber = Double(state.currentNumber) {
                let result = calculate(storedNumber, currentNumber, currentOperator)
                newState.displayText = formatResult(result)
                newState.currentNumber = formatResult(result)
                newState.storedNumber = result
                newState.currentOperator = nil
                newState.shouldResetCurrentNumber = true
            }
            
        case .clear:
            newState = initialState
            
        case .negate:
            if let number = Double(state.currentNumber) {
                let negated = -number
                newState.currentNumber = formatResult(negated)
                newState.displayText = formatResult(negated)
            }
        }
        
        return newState
    }
    
    private func calculate(_ a: Double, _ b: Double, _ op: String) -> Double {
        switch op {
        case "+": return a + b
        case "-": return a - b
        case "*": return a * b
        case "/": return b != 0 ? a / b : Double.nan
        default: return b
        }
    }
    
    private func formatResult(_ number: Double) -> String {
        if number.isNaN {
            return "Error"
        }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        
        return formatter.string(from: NSNumber(value: number)) ?? "Error"
    }
}
