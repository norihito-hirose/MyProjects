//
//  ProjectView.swift
//  MyProjects
//
//  Created by Norihito Hirose on 2023/07/28.
//  Copyright © 2023 Written Inc. All rights reserved.
//

import SwiftUI

struct ProjectView: View {
	let project: Project
	
    var body: some View {
		VStack(spacing: 10) {
			Image(systemName: "checkmark.bubble.fill")
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(maxWidth: 100)
			Text("Hello, World!")
		}
		.padding()
    }
}

#Preview {
	ProjectView(project: Project())
}
