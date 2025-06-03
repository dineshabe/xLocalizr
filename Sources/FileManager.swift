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
