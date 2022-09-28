//
//  MenToMenApp.swift
//  MenToMen
//
//  Created by Mercen on 2022/08/25.
//

import SwiftUI

public let api = "http://10.80.162.149:8080"
public let decoder: JSONDecoder = JSONDecoder()

func exitHandler() {
    UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        exit(0)
    }
}

@main
struct MenToMenApp: App {
    var body: some Scene {
        WindowGroup {
            if (try? getToken("accessToken"))!.isEmpty {
                LoginView()
            } else { MainView() }
        }
    }
}
