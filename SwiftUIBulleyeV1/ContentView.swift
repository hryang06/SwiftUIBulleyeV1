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
    
    // stage for User Interface view
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0   // @State : swift에게 변화하는지 주시하고 있으라고 한다.
    var body: some View {
        VStack {
            Spacer() // space처럼 공간 마련
            
            // target row
            HStack {
                Text("Put the bullseye as close as you can do:")
                Text("100")
            }
            Spacer()
            
            // slider row
            // TODO: add view for the slider row here
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100) // 시작화면에서는 초기값 50에 있음 / 1에서 100까지 수(double) 중에서 값이 정해짐
                Text("100")
            }
            Spacer()
            
            // button row
            Button(action: {
                print("Button pressed!") // 버튼을 누르면 cmd 창에 출력된다.
                self.alertIsVisible = true // 버튼을 누르면 alert 창이 뜬다.
            }) {
                Text("Hit me!") // user에게 보이는 버튼
            }
            // state for alert
            .alert(isPresented: self.$alertIsVisible) { // isPresented가 true이면 아래를 수행함
                Alert(title: Text("Hello there!"), // alert 창의 제목(가장 위의 굵은 글씨)
                    message: Text("The slider's value is \(Int(self.sliderValue.rounded()))."), // alert 창의 내용(제목 아래 위치) / 변수값 출력 / rounded() : 반올림
                      dismissButton: .default(Text("Awesome!"))) // alert 창의 확인 버튼(현재 한 개)
            }
            Spacer()
            
            // score row
            // TODO: add view for the score, rounds, and start over and info button
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Inform")
                }
            }.padding(.bottom, 20) // 마지막 아래 공간 두기(20칸 정도)
        }
    }
    
    // methods
}

// preview
// =========
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
