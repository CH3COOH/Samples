//
//  ContentView.swift
//  OpenCVSample
//
//  Created by KENJIWADA on 2024/01/02.
//

import SwiftUI

struct ContentView: View {
    @State private var image = UIImage(named: "sample")
    @State private var text: String?

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
            }
            if let text = text {
                Text(text)
            }
            Button("to grayscale") {
                action()
            }
            Button("clear") {
                clear()
            }
        }
        .padding()
    }

    private func action() {
        guard let source = UIImage(named: "sample") else {
            text = "画像の取得に失敗"
            return
        }

        guard let image = ImageProcessor.convert(toGrayscale: source) else {
            text = "画像の変換に失敗"
            return
        }

        self.image = image
        text = nil
    }

    private func clear() {
        image = UIImage(named: "sample")
        text = nil
    }
}

#Preview {
    ContentView()
}
