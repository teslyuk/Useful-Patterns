import Foundation

extension String {
    public var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }

    public var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }

    public func uppercaseFirstLetterString() -> String {
        if self.isEmpty {
            return self
        } else {
            return String(self.prefix(1)).uppercased(with: Locale.current) + String(self.suffix(count - 1))
        }
    }
}

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
