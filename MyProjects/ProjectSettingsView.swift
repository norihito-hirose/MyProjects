//
//  ProjectSettingsView.swift
//  MyProjects
//
//  Created by Norihito Hirose on 2023/07/28.
//  Copyright © 2023 Written Inc. All rights reserved.
//

import SwiftUI

struct ProjectSettingsView: View {
	let project: Project
	@State var projectName = ""
	
    var body: some View {
		VStack {
			TextField("Name", text: $projectName)
		}
		.padding()
    }
}

#Preview {
    ProjectSettingsView(project: Project())
}
