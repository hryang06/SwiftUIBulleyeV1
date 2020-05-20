//
//  AboutView.swift
//  SwiftUIBulleyeV1
//
//  Created by hryang on 2020/05/20.
//  Copyright © 2020 Hee-Rin Yang. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    let beige = Color(red: 1.0, green: 0.84, blue: 0.70)
    var body: some View {
        Group {
            VStack {
                Text("◎ Bullseye ◎")
                    .modifier(AboutHeadingSytle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.")
                    .modifier(AboutBodySytle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.")
                    .modifier(AboutBodySytle())
                Text("Enjoy!")
                    .modifier(AboutBodySytle())
            }
            .background(beige)
        }
        .background(Image("Background"))
    }
}

// view modifier
// ===============

struct AboutHeadingSytle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
            .foregroundColor(Color.black)
            .padding(.top, 20)
            .padding(.bottom, 20)
    }
}

struct AboutBodySytle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
            .foregroundColor(Color.black)
            .padding(.leading, 60)
            .padding(.trailing, 60)
            .padding(.bottom, 20)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}