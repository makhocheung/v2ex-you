//
//  PreferencesView.swift
//  V2 Explore (macOS)
//
//  Created by Mak Ho-Cheung on 2022/11/25.
//

import Kingfisher
import SwiftUI

struct PreferencesView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        TabView {
            GeneralView()
                .tabItem {
                    Label("通用", systemImage: "gear")
                }
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
