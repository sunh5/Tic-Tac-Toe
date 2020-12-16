//
//  TicTacToeGame.swift
//  Tic-Tac-Toe
//
//  Created by Haoxuan Sun on 12/16/20.
//

import Foundation

class TicTacToeGame: CustomStringConvertible{
    enum MarkType : String{
        case none = "-"
        case x = "X"
        case o = "O"
    }
    var board: [MarkType]
    enum State: String{
        case xTurn = "X's Turn"
        case oTurn = "O's Turn"
        case xWin = "X Wins"
        case oWin = "O Wins"
        case tie = "Tie Game"
    }
    var state: State
    init(){
//        board = [MarkType]()
//        for _ in 0..<9{
//            board.append(TicTacToeGame.MarkType.none)
//        }
        board = [MarkType](repeating: .none, count: 9)
        state = .xTurn
    }
    func pressedSquareAt(_ index: Int){
        if (board[index] != .none){
            print("Is not empty")
            return
        }
        switch state{
        case .xWin, .oWin, .tie:
            print("It's over already")
            return
        case .xTurn:
            board[index] = .x
            state = .oTurn
        case .oTurn:
            board[index] = .o
            state = .xTurn
        }
        checkForWin()
    }
    func checkForWin(){
        var linesOf3 = [String]()
         //Check for tie
        if !board.contains(.none){
            state = .tie
        }
//        linesOf3.append("\(board[0].rawValue)\(board[1].rawValue)\(board[2].rawValue)")
        linesOf3.append(getBoardString([0,1,2]))
        linesOf3.append(getBoardString([3,4,5]))
        linesOf3.append(getBoardString([6,7,8]))
        
        linesOf3.append(getBoardString([0,3,6]))
        linesOf3.append(getBoardString([1,4,7]))
        linesOf3.append(getBoardString([2,5,8]))
        
        linesOf3.append(getBoardString([0,4,8]))
        linesOf3.append(getBoardString([2,4,6]))
        
        for lineOf3 in linesOf3{
            if lineOf3 == "XXX"{
                state = .xWin
            }else if lineOf3 == "OOO"{
                state = .oWin
            }
        }
    }
    func getBoardString(_ indicies: [Int] = [0,1,2,3,4,5,6,7,8,]) -> String{
        var gameString = ""
        for index in indicies{
            gameString += board[index].rawValue
        }
        return gameString
    }
    var description: String{
        return "\(state) Board: \(getBoardString())"
    }
}


