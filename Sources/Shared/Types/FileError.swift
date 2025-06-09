//
//  File.swift
//  xLocalizr
//
//  Created by Dinesh Thangasamy on 2025-06-02.
//

import Foundation

public enum FileError: Error {
    case cannotRead(String)
    case badFileName
}
