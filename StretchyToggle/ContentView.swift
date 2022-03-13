//
//  ContentView.swift
//  StretchyToggle
//
//  Created by Todd Hamilton on 8/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var toggleScale = false
    @State var toggleOn = false
    
    var body: some View {
        ZStack{
            Color(UIColor.systemGray6)
            ZStack{
                Capsule()
                    .fill(toggleOn ? Color(.systemGreen) : Color(.systemGray))
                    .frame(width:90,height:50)
                    .shadow(color: toggleOn ? Color(.systemGreen).opacity(0.25) : .black.opacity(0.25), radius: 10, x: 0, y: 8)
                Circle()
                    .fill(Color.white)
                    .frame(width:40,height:40)
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
                    .scaleEffect(x:toggleScale ? 1.5 : 1, anchor:toggleOn ? .trailing : .leading)
                    .offset(x: toggleOn ? 20 : -20)
            }
            .scaleEffect(toggleScale ? 0.95 : 1)
            .onTapGesture {
                withAnimation(Animation.easeOut(duration:0.1)){
                    toggleScale.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(Animation.spring()) {
                            toggleScale.toggle()
                            toggleOn.toggle()
                        }
                    }
                }

            }
        }.ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
