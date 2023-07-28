//
//  ProjectImageView.swift
//  MyProjects
//
//  Created by Norihito Hirose on 2023/07/28.
//  Copyright © 2023 Written Inc. All rights reserved.
//

import SwiftUI

struct ProjectImageView: View {
	let project: Project
	
    var body: some View {
		if let cgImage = cgImage {
			Image(cgImage, scale: 1.0, label: Text(""))
				.renderingMode(.original)
		}
		else {
			Image(systemName: "checkmark.bubble.fill")
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
		}
    }
	
	var cgImage: CGImage? {
		guard let data = project.imageData else {
			return nil
		}
		guard let src = CGImageSourceCreateWithData(data as CFData, nil) else {
			return nil
		}
		guard let cgImage = CGImageSourceCreateImageAtIndex(src, 0, nil) else {
			return nil
		}
		return cgImage
	}
}

#Preview {
    ProjectImageView(project: Project())
}
