import Foundation

@main
struct XLocalizrTool {
    
    static let fileManager = FileManager()
    
  static func main() {
      
      let arguments = CommandLine.arguments
      guard arguments.count > 1 else {
          print("Usage: xLocalizr <filename> <language>(optional defaults to en)")
          exit(1)
      }

      let fileName = arguments[1]
      let language = arguments.count > 2 ? arguments[2] : "en"
      print("Open file \(fileName) and fetch translations for \(language)")
      
      do {
          if let catalog = try fileManager.readFile(fileName) {
              let parsedResult = parse(catalog, language: language)
              outputResult(parsedResult)
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
  }
    
    static func parse(_ catalog: StringCatalog, language: String) -> [String: String] {
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
    
    static func outputResult(_ dict: [String: String]) {
        let sortedKey = dict.sorted { $0.key < $1.key }

        for (key, value) in sortedKey {
            print("\(key): \(value)")
        }
    }
}
