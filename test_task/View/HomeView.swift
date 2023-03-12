//
//  HomeView.swift
//  test_task
//
//  Created by Alikhan Nursapayev on 12.03.2023.
//

import SwiftUI

struct HomeView: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("AccentColor"))
    }
    @State private var origin = ""
    @State private var destination = ""
    @State private var fromDate = Date()
    @State private var isFromDateShown = false
    @State private var backDate = Date()
    @State private var isBackDateShown = false
    @State private var isDarkMode = true
    @State private var segmentSelection = 0
    @State var showModal = false
    
    @State var isOn = false
    let items = ["Алматы 2 — Петропавловск", "Астана – Семей", "Алматы 1 – Караганда"]
    let subitems = ["30 нояб – 6 дек", "30 нояб – 6 дек", "30 нояб – 6 дек"]
    var body: some View {
        
        ZStack{
            

            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    Text("Поиск билетов")
                        .foregroundColor(Color(isDarkMode ? .black : .white))
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(0)
                        .padding(.leading, 16)
                    Spacer()
                    CustomSwitch(isDarkMode: $isDarkMode)
                        .padding(.vertical, 10)
                        .labelsHidden()
                        .padding(.trailing, 16)
                }
                
                    Picker("", selection: $segmentSelection) {
                        Text("ЖL билеты").tag(0)
                        Text("Авиа билеты")
                            .tag(1)
                        
                    }
                    
                    .pickerStyle(SegmentedPickerStyle())
                    .colorScheme(.dark)
                    .frame(height: 44)
                    .padding(.horizontal, 16)
                
                
                HStack {
                    VStack(spacing: 0) {
                        TextField("Откуда", text: $origin, onEditingChanged: { began in
                            if began {
                                showModal = true
                            } else {
                                showModal = false
                            }
                        })
                        .padding(.leading, 16)
                        .frame(minHeight: 44)
                        .frame(minHeight: 44)
                        
                        TextField("Куда", text: $destination)
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                            .frame(minHeight: 44)
                    }
                    .preferredColorScheme(isDarkMode ? .light : .dark)
//                    .sheet(isPresented: $showModal) {
//                        ModalSearchView()
//                        
//                    }
                    Image(systemName: "arrow.right.arrow.left")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 16)
                }
                .background(Color(.white).opacity(0.1))
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .clipShape(RoundedRectangle(cornerRadius: 4000 / UIScreen.main.scale))
               
                HStack {
                    VStack {
                        DatePicker("From", selection: $fromDate, displayedComponents: [.date])
                            .datePickerStyle(CompactDatePickerStyle())
                            .padding(.leading, 16)
                            .frame(minHeight: 44)
                    }
                    
                    Image(systemName: "calendar")
                        .padding(.horizontal, 16)
                    
                    VStack {
                        DatePicker("From", selection: $backDate, displayedComponents: [.date])
                            .datePickerStyle(CompactDatePickerStyle())
                            .padding(.leading, 16)
                            .frame(minHeight: 44)
                        
                    }
                    .padding(.trailing, 16)
                    .frame(minHeight: 44)
                    
                    Image(systemName: "plus")
                        .padding(.horizontal, 16)
                        .onTapGesture {
                            // Handle back date selection
                        }
                }
                .background(Color.secondary.opacity(0.1))
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                
                Button(action: {
                    // Your action code here
                }) {
                    Text("Найти билеты")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(Color("AccentColor"))
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                }
                
                Spacer()
                ZStack {
                    Color(.black)
                    List {
                        ForEach(0..<items.count) { index in
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                                VStack(alignment: .leading) {
                                    Text(items[index])
                                        .font(.headline)
                                    Text(subitems[index])
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }.listRowBackground(Color.red.opacity(0))
                        }
                    }
                }
                
            }
        }
        .background(Color(isDarkMode ? "BackgroundLight" : "BackgroundDark"))
    }
    
    
    private let itemFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
