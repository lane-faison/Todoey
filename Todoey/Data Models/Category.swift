//
//  Category.swift
//  Todoey
//
//  Created by Lane Faison on 6/24/19.
//  Copyright © 2019 Lane Faison. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundHex: String = ""
    let items = List<Item>()
}
