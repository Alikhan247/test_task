//
//  CustomSwitch.swift
//  test_task
//
//  Created by Alikhan Nursapayev on 07.03.2023.
//

import SwiftUI

struct CustomSwitch: View {
    
    @Binding public var isDarkMode: Bool
    
    var body: some View {
        ZStack {
            
            VStack (){
                ZStack {
                    Capsule()
                        .frame(width:58,height:32)
                        .foregroundColor(Color(isDarkMode ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1028798084) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6039008336)))
                    ZStack{
                        Circle()
                            .frame(width:40, height:32)
                            .foregroundColor(.white)
                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                    }
                    .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
                    .offset(x:isDarkMode ? 18 : -18)
                    .padding(24)
                    .animation(.spring())
                }
                .onTapGesture {
                    self.isDarkMode.toggle()
                }
            }
        }
        .animation(.default)
        
    }
}

struct CustomSwitch_Previews: PreviewProvider {
    static var previews: some View {
        CustomSwitch(isDarkMode: Binding<Bool>(
            get: { false },
            set: {
                    // $0 is the new Bool value of the toggle
                    // Your code for updating the model, or whatever
                    print("value: \($0)")
                }))
    }
}
