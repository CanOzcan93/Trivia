//
//  StringExtension.swift
//  Trivia
//
//  Created by Can Özcan on 29.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

extension String {
    /// Converts HTML string to a `NSAttributedString`

    var htmlAttributedString: String? {
        return try? NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil).string
    }
}
