import Foundation
import Shared

@main
struct XLocalizrTool {
    
  static func main() {
      
      let stringCatalog = StringCatalogManager()
      let output = OutputStream()
      
      //Argument manager
      let arguments = CommandLine.arguments
      guard arguments.count > 1 else {
          print("Usage: xLocalizr <filename> <language>(optional defaults to en)")
          exit(1)
      }
      let fileName = arguments[1]
      let language = arguments.count > 2 ? arguments[2] : "en"
      print("Open file \(fileName) and fetch translations for \(language)")
    
      let catalog = stringCatalog.fetch(fileName: fileName, language: language)
      output.write(catalog)
  }
}
