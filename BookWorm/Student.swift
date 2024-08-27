//
//  Student.swift
//  BookWorm
//
//  Created by Naveed on 27/08/2024.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

