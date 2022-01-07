//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation

class CalculatorBrain {
    //istenen işlemler + - * / bonus C CE =
    //standford university ios 9 > youtube video 1 ya da 2
    private var accumulator: Double = 0
   
    
    var result: Double {
        get {
            return accumulator
        }
    }
    
    private enum Operation {
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
        case delete((Double) -> Double)
        
    }
    
    // Mark: I used Stanford University IOS 9 section while writing these codes.
    private var operations: Dictionary<String, Operation> = [
        "√" : Operation.unaryOperation(sqrt),
        "%" : Operation.unaryOperation({$0/100}),
        "x" : Operation.binaryOperation({$0 * $1}),
        "/" : Operation.binaryOperation({$0 / $1}),
        "+" : Operation.binaryOperation({$0 + $1}),
        "−" : Operation.binaryOperation({$0 - $1}),
        "=" : Operation.equals,
        "C" : Operation.delete({ _ in 0.0})
    ]
    
    func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator)
                }
            case .binaryOperation(let f):
                if accumulator != nil {
                    pbo = PendingBinaryOperation(function: f, firstOperand: accumulator)
                    accumulator = result
                }
            case .equals:
                if accumulator != nil {
                    performPBO()
                }
            case .delete(_):
                accumulator = 0.0
            }
        }
    }
    
    func performPBO() {
        if pbo != nil && accumulator != nil{
            accumulator = pbo!.perform(with: accumulator)
            pbo = nil
        }
    }
    
    private var pbo: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand,secondOperand)
        }
    }
    
    func setOperand(_ operand: Double) {
        accumulator = operand
    }
}
