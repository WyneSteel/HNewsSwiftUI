//
//  WebView.swift
//  HNewsSwiftUI
//
//  Created by Wynelher Tagayuna on 3/30/23.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{// Integrate UIKit to SwiftUI.
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
