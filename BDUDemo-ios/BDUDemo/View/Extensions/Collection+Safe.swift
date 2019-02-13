public extension Collection {
    public subscript(safe index: Index) -> Element? {
        guard index >= startIndex && index < endIndex else { return nil }
        return self[index]
    }
}
