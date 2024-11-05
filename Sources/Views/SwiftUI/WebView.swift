//
//  WebView.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//


import SwiftUI
import WebKit

public struct WebView: View {
    public let url: URL?
    public var options: Options = .init()

    public struct Options {
        public var loadingTitle: String? = "Loading..."
        public var loadedTitle: String? = nil

        public init(
            loadingTitle: String? = "Loading...",
            loadedTitle: String? = nil
        ) {
            self.loadingTitle = loadingTitle
            self.loadedTitle = loadedTitle
        }
    }

    @State private var loadedPageTitle: String? = nil

    public init(_ url: URL?, options: Options = .init()) {
        self.url = url
        self.options = options
    }

    public init(url: URL?, options: Options = .init()) {
        self.url = url
        self.options = options
    }

    public init(_ string: String, options: Options = .init()) {
        self.url = URL(string: string)
        self.options = options
    }

    public init(string: String, options: Options = .init()) {
        self.url = URL(string: string)
        self.options = options
    }

    public var body: some View {
        WebViewRepresentable(
            url: self.url,
            loadedPageTitle: $loadedPageTitle
        )
        .navigationBarTitle(visibleTitle, displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
    }

    private var visibleTitle: String {
        if let loadedPageTitle {
            return options.loadedTitle ?? loadedPageTitle
        }
        return options.loadingTitle ?? ""
    }
}

fileprivate struct WebViewRepresentable: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let url: URL?
    @Binding var loadedPageTitle: String?

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url, url != context.coordinator.lastLoadedURL {
            let request = URLRequest(url: url)
            uiView.load(request)
            context.coordinator.lastLoadedURL = url
            self.loadedPageTitle = nil
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewRepresentable
        var lastLoadedURL: URL? = nil

        init(_ parent: WebViewRepresentable) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.title") { result, error in
                if let title = result as? String {
                    self.parent.loadedPageTitle = title
                } else {
                    self.parent.loadedPageTitle = ""
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        WebView("https://www.apple.com")
    }
}
