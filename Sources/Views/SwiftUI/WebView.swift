//
//  WebView.swift
//  v0
//
//  Created by Daniel Amitay on 9/20/24.
//


import SwiftUI
import WebKit

public struct WebView: View {
    let urlString: String
    var initialNavigationTitle: String = "Loading..."

    @State private var navigationBarTitle: String = ""

    public var body: some View {
        WebViewRepresentable(
            urlString: urlString,
            navigationBarTitle: $navigationBarTitle
        )
        .navigationBarTitle(navigationBarTitle, displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
        .onChange(of: urlString) { _ in
            navigationBarTitle = initialNavigationTitle
        }
        .onLoad {
            navigationBarTitle = initialNavigationTitle
        }
    }
}

fileprivate struct WebViewRepresentable: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let urlString: String
    @Binding var navigationBarTitle: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewRepresentable
        init(_ parent: WebViewRepresentable) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.title") { result, error in
                if let title = result as? String {
                    self.parent.navigationBarTitle = title
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        WebView(urlString: "https://www.apple.com")
    }
}
