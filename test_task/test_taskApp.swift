//
//  test_taskApp.swift
//  test_task
//
//  Created by Alikhan Nursapayev on 05.03.2023.
//

import SwiftUI

@main
struct test_taskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
