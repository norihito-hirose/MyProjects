//
//  ProjectView.swift
//  MyProjects
//
//  Created by Norihito Hirose on 2023/07/28.
//  Copyright © 2023 Written Inc. All rights reserved.
//

import SwiftUI

struct ProjectView: View {
	@Bindable var project: Project
	
    var body: some View {
		VStack(spacing: 10) {
			HStack(spacing: 10, content: {
				Image(systemName: "checkmark.bubble.fill")
					.renderingMode(.original)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 72)
				TextField("", text: $project.name)
					.font(.title)
			})
			Spacer()
		}
		.padding()
    }
}

#Preview {
	ProjectView(project: Project())
}
