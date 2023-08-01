//
//  ContentView.swift
//  MyProjects
//
//  Created by Norihito Hirose on 2023/07/28.
//  Copyright © 2023 Written Inc. All rights reserved.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var projects: [Project]

    var body: some View {
        NavigationSplitView {
            List {
				Section("My Projects") {
					NavigationLink {
						DashboardView()
					} label: {
						Text("Dashboard")
					}
				}
				.collapsible(false)
				Section("Projects") {
					ForEach(projects) { project in
						NavigationLink {
							ProjectView(project: project)
						} label: {
							Text(project.creationDate, format: Date.FormatStyle(date: .numeric, time: .standard))
						}
					}
					.onDelete(perform: deleteProjects)
				}
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addProject) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addProject() {
        withAnimation {
            let project = Project()
            modelContext.insert(project)
        }
    }

    private func deleteProjects(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(projects[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Project.self, inMemory: true)
}
