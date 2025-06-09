//
//  File.swift
//  xLocalizr
//
//  Created by Dinesh Thangasamy on 2025-06-02.
//

import Foundation

// MARK: - StringCatalog
public struct StringCatalog: Codable {
    let sourceLanguage: String
    let strings: [String: LocalizedString]
    let version: String
}

public struct LocalizedString: Codable {
    let localizations: [String: Localization]?
}

public struct Localization: Codable {
    let stringUnit: StringUnit
}

public struct StringUnit: Codable {
    let state: String
    let value: String
}
