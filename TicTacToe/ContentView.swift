//
//  ContentView.swift
//  TicTacToe
//
//  Created by nasrinlida on 6/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isCrossChecked = true
    
    @State private var array: [[Bool?]] = [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
    ]
    
    let crossSelectionGradient = LinearGradient(
        gradient: Gradient(colors:[
            Color("crossButtonGradientStartColor"),
            Color("crossButtonGradientEndColor")
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
    let crossNoSelection = LinearGradient(
        gradient: Gradient(colors:[Color.clear]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image("cross")
                    .renderingMode(.original)
                    .frame(width: 100, height: 100)
                    .background(.white)
                    .cornerRadius(4)
                    .shadow(
                        color: isCrossChecked ?
                        Color("crossButtonGradientStartColor").opacity(0.74) : Color.black.opacity(0.1),
                        radius: 4, x: 0, y: 4)
                    .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(
                            isCrossChecked ? crossSelectionGradient : crossNoSelection,
                            lineWidth: 2
                        )
                    )
                
                Spacer()
                
                Image("circle")
                    .renderingMode(.original)
                    .frame(width: 100, height: 100)
                    .background(.white)
                    .cornerRadius(4)
                    .shadow(color: isCrossChecked ? .black.opacity(0.1) : Color("circleBorder").opacity(0.5), radius: 4, x: 0, y: 4)
                    .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(
                            isCrossChecked ? Color.clear : Color("circleBorder"),
                            lineWidth: 2
                        )
                    )
            }
            .padding(.horizontal, 60)
            
            Spacer()
            
            VStack(spacing: 36) {
                HStack(spacing: 36) {
                    Button {
                        array[0][0] = isCrossChecked
                        isCrossChecked.toggle()
                        checkGameResult()
                    } label: {
                        Image(getImageName(state: array[0][0]))
                            .frame(width: 90, height: 90)
                            .background(.white)
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    }
                    
                    Button {
                        array[0][1] = isCrossChecked
                        isCrossChecked.toggle()
                        checkGameResult()
                    } label: {
                        Image(getImageName(state: array[0][1]))
                            .frame(width: 90, height: 90)
                            .background(.white)
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    }
                    
                    Button {
                        array[0][2] = isCrossChecked
                        isCrossChecked.toggle()
                        checkGameResult()
                    } label: {
                        Image(getImageName(state: array[0][2]))
                            .frame(width: 90, height: 90)
                            .background(.white)
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    }
                }
                
                HStack(spacing: 36) {
                    Button {
                        array[1][0] = isCrossChecked
                        isCrossChecked.toggle()
                        checkGameResult()
                    } label: {
                        Image(getImageName(state: array[1][0]))
                            .frame(width: 90, height: 90)
                            .background(.white)
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    }
                    
                    Button {
                        array[1][1] = isCrossChecked
                        isCrossChecked.toggle()
                        checkGameResult()
                    } label: {
                        Image(getImageName(state: array[1][1]))
                            .frame(width: 90, height: 90)
                            .background(.white)
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    }

                    Button {
                        array[1][2] = isCrossChecked
                        isCrossChecked.toggle()
                        checkGameResult()
                    } label: {
                        Image(getImageName(state: array[1][2]))
                            .frame(width: 90, height: 90)
                            .background(.white)
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    }
                }
                
                HStack(spacing: 36) {
                    Button {
                        array[2][0] = isCrossChecked
                        isCrossChecked.toggle()
                        checkGameResult()
                    } label: {
                        Image(getImageName(state: array[2][0]))
                            .frame(width: 90, height: 90)
                            .background(.white)
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    }
                    
                    Button {
                        array[2][1] = isCrossChecked
                        isCrossChecked.toggle()
                        checkGameResult()
                    } label: {
                        Image(getImageName(state: array[2][1]))
                            .frame(width: 90, height: 90)
                            .background(.white)
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    }
                    
                    Button {
                        array[2][2] = isCrossChecked
                        isCrossChecked.toggle()
                        checkGameResult()
                    } label: {
                        Image(getImageName(state: array[2][2]))
                            .frame(width: 90, height: 90)
                            .background(.white)
                            .cornerRadius(4)
                            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
                    }
                }
            }
            
            Spacer()
        }
        .background(Color("backgroundColor"))
        .onAppear {
            startGame()
        }
        .alert(alertMessage, isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                startGame()
            }
        }
    }
    
//    func gettImageName(state: Bool?) -> String {
//        if state == nil {
//            return ""
//        } else if state == false {
//            return "circle"
//        } else {
//            return "cross"
//        }
//    }
    
    func getImageName(state: Bool?) -> String {
        if state == nil {
            return ""
        } else if state == false {
            return "circle"
        } else {
            return "cross"
        }
    }
    
    func startGame() {
        isCrossChecked = Bool.random()
        array = [
            [nil, nil, nil],
            [nil, nil, nil],
            [nil, nil, nil]
        ]
    }
    
    func checkGameResult() {
        guard let winner = checkForWinner() else {
            var allBoxChecked = true
            
            for columns in 0..<3 {
                for rows in 0..<3 {
                    if array[rows][columns] == nil {
                        allBoxChecked = false
                    }
                }
            }
            if allBoxChecked == true {
                alertMessage = "Game Over!"
                showingAlert = true
            }
            
            return
        }
        if winner == true {
            alertMessage = "cross won"
        } else {
            alertMessage = "circle won"
        }
        showingAlert = true
    }
    
    func checkForWinner() -> Bool? {
        var rows = 0
        var columns = 0
        
        var allTrue = true
        var allFalse = true
        
        //MARK: - COLUMN WISE ITERATION
        
        for columns in 0..<3 {
            allTrue = true
            allFalse = true
            for rows in 0..<3 {
                if array[rows][columns] != true {
                    allTrue = false
                }
                if array[rows][columns] != false {
                    allFalse = false
                }
                
            }
            if allTrue == true {
                return true
            }
            if allFalse == true {
                return false
            }
        }
        //MARK: - ROW WISE ITERATION
        
        for rows in 0..<3 {
            allTrue = true
            allFalse = true
            for columns in 0..<3 {
                if array[rows][columns] != true {
                    allTrue = false
                }
                if array[rows][columns] != false {
                    allFalse = false
                }
            }
            if allTrue == true {
                return true
            }
            if allFalse == true {
                return false
            }
        }
        
        //MARK: - LEFT DIAGONAL
        allTrue = true
        allFalse = true
        while rows < 3 && columns < 3 {
            if array[rows][columns] != true {
                allTrue = false
            }
            if array[rows][columns] != false {
                allFalse = false
            }
            
            rows += 1
            columns += 1
        }
        if allTrue == true {
            return true
        }
        if allFalse == true {
            return false
        }

        allTrue = true
        allFalse = true

        rows = 0
        columns = array.count - 1
    //MARK: - RIGHT DIAGONAL
        while rows < array.count && columns >= 0 {
            if array[rows][columns] != true {
                allTrue = false
            }
            if array[rows][columns] != false {
                allFalse = false
            }
            rows += 1
            columns -= 1
        }
        
        if allTrue == true {
            return true
        }
        if allFalse == true {
            return false
        }
        
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
