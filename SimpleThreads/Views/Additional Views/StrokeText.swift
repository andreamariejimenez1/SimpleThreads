//
//  StrokeText.swift
//  SimpleThreads
//
//  Created by RODERICK SIMMS on 10/25/22.
//

import SwiftUI

struct StrokeText: View {
    
    let text: String
    let width: CGFloat
    let color: Color
    
    var body: some View {
        ZStack {
            ZStack {
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
