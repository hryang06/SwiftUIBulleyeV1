//
//  ContentView.swift
//  SwiftUIBulleyeV1
//
//  Created by hryang on 2020/05/13.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    var body: some View {
        VStack {
            Text("Welcome to my first App!")
                .fontWeight(.semibold)
                .foregroundColor(Color.purple)
            
            Button(action: {
                print("Button pressed!") // 버튼을 누르면 cmd 창에 출력된다.
                self.alertIsVisible = true // 버튼을 누르면 alert 창이 뜬다.
            }) {
                Text("Hit me!") // user에게 보이는 버튼
            }
            .alert(isPresented: self.$alertIsVisible) { // isPresented가 true이면 아래를 수행함
                Alert(title: Text("Hello there!"), // alert 창의 제목(가장 위의 굵은 글씨)
                      message: Text("This is my first pop-up."), // alert 창의 내용(제목 아래 위치)
                      dismissButton: .default(Text("Awesome!"))) // alert 창의 확인 버튼(현재 한 개)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
