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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
