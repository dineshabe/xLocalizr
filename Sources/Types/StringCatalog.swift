//
//  File.swift
//  xLocalizr
//
//  Created by Dinesh Thangasamy on 2025-06-02.
//

import Foundation

// MARK: - StringCatalog
struct StringCatalog: Codable {
    let sourceLanguage: String
    let strings: [String: LocalizedString]
    let version: String
}

struct LocalizedString: Codable {
    let localizations: [String: Localization]?
}

struct Localization: Codable {
    let stringUnit: StringUnit
}

struct StringUnit: Codable {
    let state: String
    let value: String
}
