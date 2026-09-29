import Foundation
import Combine

struct DownloadItem: Identifiable {
    let id = UUID()
    let url: String
    var status = "等待中"
}

final class DownloadManager: ObservableObject {
    @Published var items: [DownloadItem] = []

    func enqueue(_ text: String) {
        let links = text.split(whereSeparator: { $0 == "\n" || $0 == "\r" })
            .map(String.init).map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { $0.hasPrefix("http://") || $0.hasPrefix("https://") }
        items.append(contentsOf: links.map { DownloadItem(url: $0) })
    }
}
