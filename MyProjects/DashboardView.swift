//
//  DashboardView.swift
//  MyProjects
//
//  Created by Norihito Hirose on 2023/07/28.
//  Copyright © 2023 Written Inc. All rights reserved.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
	@Environment(\.modelContext) private var modelContext
	@Query private var projects: [Project]

	var body: some View {
		let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 200)), count: 1)
		NavigationStack {
			ScrollView() {
				LazyVGrid(columns: columns, content: {
					ForEach(projects) { project in
						NavigationLink {
							Text("Hello world!")
						} label: {
							ProjectView(project: project)
								.frame(minWidth: 100, minHeight: 200)
						}
					}
					.onDelete(perform: deleteProjects)
				})
				.padding()
			}
		}
		.toolbar {
#if os(iOS)
			ToolbarItem(placement: .navigationBarTrailing) {
				EditButton()
			}
#endif
			ToolbarItem {
				Button(action: addItem) {
					Label("Add Item", systemImage: "plus")
				}
			}
		}
	}

	private func addItem() {
		withAnimation {
			let newItem = Project()
			modelContext.insert(newItem)
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
	DashboardView()
		.modelContainer(for: Project.self, inMemory: true)
}
