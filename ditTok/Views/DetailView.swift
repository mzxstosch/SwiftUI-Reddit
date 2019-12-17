//
//  DetailView.swift
//  ditTok
//
//  Created by Sven Arends on 17/12/2019.
//  Copyright © 2019 Sven Arends. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://reddit.com")
    }
}

