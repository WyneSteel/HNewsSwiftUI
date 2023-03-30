//
//  DetailView.swift
//  HNewsSwiftUI
//
//  Created by Wynelher Tagayuna on 3/29/23.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com.ph")
    }
}

