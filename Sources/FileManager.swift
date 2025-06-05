import Foundation

struct FileManager {
    func readFile(_ fileName: String) throws -> StringCatalog? {
        
        guard !fileName.isEmpty else { throw FileError.badFileName }
        
        let fileURL = URL(fileURLWithPath: fileName)
        do {
            let fileData = try Data(contentsOf: fileURL)
            let catalog = try JSONDecoder().decode(StringCatalog.self, from: fileData)
            return catalog
        } catch {
            print("Failed to decode JSON: \(error)")
            throw FileError.cannotRead(error.localizedDescription)
       }
    }
}

struct StringCatalogManager {
    let fileManager = FileManager()
    
    func fetch(fileName: String, language: String) -> [String: String]{
        do {
            if let catalog = try fileManager.readFile(fileName) {
                return parse(catalog, language: language)
            }
        } catch {
            if let fileError = error as? FileError {
                switch fileError {
                case .badFileName:
                    print("Bad file name")
                case .cannotRead(let message):
                    print("Unable to read file \(message)")
                }
            } else {
                print("Unknown error")
            }
        }
        return [:]
    }
    
    func parse(_ catalog: StringCatalog, language: String) -> [String: String] {
        var result = [String: String]()
        
        for item in catalog.strings {
            if let localizations = item.value.localizations, let translation = localizations[language]?.stringUnit.value {
                result[item.key] = translation
            } else {
                result[item.key] = item.key
            }
        }
        return result
    }
}

struct OutputStream {
    func write(_ outputValue: [String: String]) {
        let sortedResult = outputValue.sorted { $0.key < $1.key }
        for (key, value) in sortedResult {
            print("\(key) = \(value)")
        }
    }
}
