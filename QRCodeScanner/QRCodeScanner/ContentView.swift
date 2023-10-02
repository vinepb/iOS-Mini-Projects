//
//  ContentView.swift
//  QRCodeScanner
//
//  Created by Vinicius Bernardo on 23/09/23.
//

import SwiftUI

struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started."
    
//    var scannerSheet : some View {
//        CodeScannerView(
//            CodeScannerView(codeTypes: [.qr], completion: <#T##(Result<ScanResult, ScanError>) -> Void#>)
//        )
//    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
