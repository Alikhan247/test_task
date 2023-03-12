//
//  ContentView.swift
//  test_task
//
//  Created by Alikhan Nursapayev on 05.03.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var selectedTab = 0
    @State var toggleOn =  false
 
    var body: some View {
        TabView(selection: $selectedTab) {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Главная")
                        }
                        .tag(0)
            
            TripsView()
                .tabItem {
                    Image(systemName: "car")
                    Text("Поездки")
                }
                .tag(1)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Поиск")
                }
                .tag(2)
            
            HelpView()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Помощь")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Профиль")
                }
                .tag(4)
                }
        }
}

struct ModalSearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
               Text("From")
                   .font(.title)
                   .fontWeight(.bold)
                   .frame(maxWidth: .infinity, alignment: .center)

               HStack {
                   Image(systemName: "magnifyingglass")
                   TextField("Press to search", text: $searchText)
               }
               .padding()
               .background(Color.gray.opacity(0.2))
               .cornerRadius(10)
               .padding(.horizontal)

               HStack {
                   Text("Before")
                       .font(.headline)
                       .fontWeight(.semibold)
                       .padding(.leading)

                   Spacer()

                   VStack(alignment: .leading) {
                       Text("Item 1")
                       Text("Item 2")
                   }
                   .padding()
                   .background(Color.gray.opacity(0.2))
                   .cornerRadius(10)
               }
               .padding()
               .background(Color.gray.opacity(0.2))
               .cornerRadius(10)
               .padding(.horizontal)
           }
           .padding()
       }
}

struct TripsView: View {
    var body: some View {
        Text("hi")
    }
}
struct SearchView: View {
    var body: some View {
        VStack {
            Text("Help")
                .font(.title)
            Spacer()
        }
    }
}
struct HelpView: View {
    var body: some View {
        VStack {
            Text("Help")
                .font(.title)
            Spacer()
        }
    }
}
struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Help")
                .font(.title)
            Spacer()
        }
    }
}
struct ImageToggleStyle: ToggleStyle {
    
    var onImageName: String
    var offImageName: String
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(configuration.isOn ? onImageName : offImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(Animation.linear(duration: 0.1))
                ).cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
        
            
    }
}


extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)  // << here !!
    }
}
