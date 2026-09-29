import SwiftUI

struct ContentView: View {
    @StateObject private var manager = DownloadManager()
    @State private var input = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                TextEditor(text: $input)
                    .frame(minHeight: 130)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(.secondary))
                    .overlay(alignment: .topLeading) {
                        if input.isEmpty { Text("每行粘贴一个 Instagram 公开帖子或 Reels 链接").foregroundStyle(.secondary).padding(8) }
                    }
                HStack {
                    Button("从剪贴板粘贴") { input = UIPasteboard.general.string ?? "" }
                    Spacer()
                    Button("加入下载队列") { manager.enqueue(input); input = "" }
                        .buttonStyle(.borderedProminent)
                }
                List(manager.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.url).lineLimit(1).font(.subheadline)
                        Text(item.status).font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
            .padding()
            .navigationTitle("InstaBatch")
        }
    }
}
