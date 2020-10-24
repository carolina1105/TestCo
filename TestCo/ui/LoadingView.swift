//
//  LoadingView.swift
//  NetworkiN
//
//  Created by Luis Pineda on 24/04/20.
//  Copyright © 2020 Luis Pineda. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    let limitCircle: Int = 5
    let sizeCircle: CGFloat = 0.2
    
    @State private var isAnimating: Bool = false
    var width: CGFloat
    var color: Color
    
    init (width: CGFloat = 60,
//          color: Color = Color.nTint){
        color: Color = Color.yellow){

        self.width = width
        self.color = color
    }
    
    var body: some View {
        let scaleEffect = { (index: Int) -> CGFloat in
            self.isAnimating
                ? 0.2 + CGFloat(index) / CGFloat(self.limitCircle)
                : 1 - CGFloat(index) / CGFloat(self.limitCircle)
        }
        let animation = { (index: Int) -> Animation in
            Animation
                .timingCurve(0.5,
                             0.15 + Double(index) / Double(self.limitCircle),
                             0.25, 1,
                             duration: 1.5)
                .repeatForever(autoreverses: false)
        }
        
        return GeometryReader { (geometry: GeometryProxy) in
            ForEach(.zero ..< self.limitCircle) { index in
                Group {
                    Circle()
                        .frame(width: geometry.size.width * self.sizeCircle,
                               height: geometry.size.height * self.sizeCircle)
                        .scaleEffect(scaleEffect(index))
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
                    .rotationEffect(self.isAnimating ? .degrees(360) : .degrees(0))
                .animation(animation(index))
                    .foregroundColor(self.color)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear { self.isAnimating = true }
        .frame(width: width, height: width)
    }
}

struct LoadingListView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack {
                Spacer()
                    LoadingView()
                Spacer()
            }
            Spacer()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
//        LoadingView(color: Color.nFourth)
        LoadingView(color: Color.green)

    }
}
