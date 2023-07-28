//
//  Project.swift
//  MyProjects
//
//  Created by Norihito Hirose on 2023/07/28.
//  Copyright © 2023 Written Inc. All rights reserved.
//

import Foundation
import SwiftData

@Model
final class Project {
	var name = "New project"
    var creationDate: Date
	var imageData: Data?
    
    init() {
        self.creationDate = Date()
    }
}
