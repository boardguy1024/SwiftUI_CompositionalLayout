//
//  Card.swift
//  SwiftUI_CompositionalLayout
//
//  Created by park kyung seok on 2021/09/20.
//

import SwiftUI

struct Card: Identifiable, Decodable, Hashable {
    var id: String
    var download_url: String
    var author: String
}
