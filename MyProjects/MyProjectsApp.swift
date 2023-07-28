//
//  MyProjectsApp.swift
//  MyProjects
//
//  Created by Norihito Hirose on 2023/07/28.
//  Copyright © 2023 Written Inc. All rights reserved.
//

import SwiftUI
import SwiftData

@main
struct MyProjectsApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Project.self)
    }
}
