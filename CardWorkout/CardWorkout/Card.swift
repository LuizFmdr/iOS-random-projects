import Foundation
import UIKit

struct Card {
    
    static func generateCardaList() -> [UIImage] {
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("cards.bundle")
        var cardList = [UIImage]()
        
        do {
            let contents = try fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)
            
            for item in contents {
                cardList.append(UIImage(imageLiteralResourceName: item.lastPathComponent))
            }
            
        } catch let error as NSError {
            print(error)
        }
        
        return cardList
    }
}
