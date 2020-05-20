//
//  ContentView.swift
//  SwiftUIBulleyeV1
//
//  Created by hryang on 2020/05/13.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // properties
    // ============
    
    // color
    let midnightBlue = Color(red: 0, green: 0.2, blue: 0.4)
    
    // stage for User Interface view
    @State var alertIsVisible = false
    @State var sliderValue = 50.0   // @State : swift에게 변화하는지 주시하고 있으라고 한다.
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    var sliderValueRounded: Int {
        Int(sliderValue.rounded()) }
    var sliderTargetDifference: Int {
        abs(sliderValueRounded - target)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer() // space처럼 공간 마련
                
                // target row
                HStack {
                    Text("Put the bullseye as close as you can do:")
                        .modifier(LabelStyle())
                    Text("\(target)")
                        .modifier(ValueStyle())
                }
                Spacer()
                
                // slider row
                // TODO: add view for the slider row here
                HStack {
                    Text("1")
                        .modifier(LabelStyle())
                    Slider(value: $sliderValue, in: 1...100)
                        .accentColor(midnightBlue)
                    Text("100")
                        .modifier(LabelStyle())
                }
                Spacer()
                
                // button row
                Button(action: {
                    //print("Button pressed!") // 버튼을 누르면 cmd 창에 출력된다.
                    print("Points awarded: \(self.pointsForCurrentRound())")
                    self.alertIsVisible = true // 버튼을 누르면 alert 창이 뜬다.
                }) {
                    Text("Hit me!").modifier(ButtonLargeTextStyle())
                }
                .background(Image("Button"))
                .modifier(Shadow())
                // state for alert
                .alert(isPresented: $alertIsVisible) { // isPresented가 true이면 아래를 수행함
                    Alert(title: Text(alertTitle()),
                          message: Text(scoringMessage()),
                          dismissButton: .default(Text("Awesome!")){ // alert 창의 확인 버튼(현재 한 개)
                            self.startNewRound()
                        })
                }
                Spacer()
                
                // score row
                // TODO: add view for the score, rounds, and start over and info button
                HStack {
                    Button(action: {
                        self.startNewGame()
                    }) {
                        HStack {
                            Image("StartOverIcon")
                            Text("Start Over").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button"))
                    .modifier(Shadow())
                    Spacer()
                    Text("Score:")
                        .modifier(LabelStyle())
                    Text("\(score)")
                        .modifier(ValueStyle())
                    Spacer()
                    Text("Round:")
                        .modifier(LabelStyle())
                    Text("\(round)")
                        .modifier(ValueStyle())
                    Spacer()
                    NavigationLink(destination: AboutView()) {
                        HStack {
                            Image("InfoIcon")
                            Text("Inform").modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button"))
                    .modifier(Shadow())
                }.padding(.bottom, 20) // 마지막 아래 공간 두기(20칸 정도)
            }
            .onAppear() {
                self.startNewGame()
            }
            .background(Image("Background"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // methods
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let points: Int
        if sliderTargetDifference == 0 {
            points = 200
        } else if sliderTargetDifference == 1 {
            points = 150
        } else {
            points = maximumScore - sliderTargetDifference
        }
        return points
    }
    
    func scoringMessage() -> String {
        return "The slider's value is \(sliderValueRounded).\n" +
        "The target value is \(target).\n" +
        "You scored \(pointsForCurrentRound()) points this record."
    }
    
    func alertTitle() -> String {
        let title: String
        if sliderTargetDifference == 0 {
            title = "Perfect!"
        } else if sliderTargetDifference < 5 {
            title = "You almost had it!"
        } else if sliderTargetDifference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func startNewGame() {
        score = 0
        round = 1
        resetSliderAndTarget()
    }
    
    func startNewRound() {
        score = self.score + self.pointsForCurrentRound()
        round += 1
        resetSliderAndTarget()
    }
    
    func resetSliderAndTarget() {
        sliderValue = Double.random(in: 1...100)
        target = Int.random(in: 1...100)
    }
}

// view modifiers
// ===============
struct LabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(Color.white)
            .modifier(Shadow())
    }
}

struct ValueStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
            .foregroundColor(Color.yellow)
            .modifier(Shadow())
    }
}

// shadow
struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
    }
}

// for the "Hit me!" button
struct ButtonLargeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(Color.black)
    }
}

// for the "Start Over" and "Info" buttons
struct ButtonSmallTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
            .foregroundColor(Color.black)
    }
}

// preview
// =========
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
