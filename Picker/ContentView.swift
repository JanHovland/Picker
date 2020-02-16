//
//  ContentView.swift
//  Picker
//
//  Created by Jan Hovland on 16/02/2020.
//  Copyright © 2020 Jan Hovland. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var colours = ["Egersund", "Vigrestad", "Varhaug", "Nærbø", "Bryne", "Klepp", "Sandnes"]
    @State private var selection = 0
    @State private var pickerVisible = false

    var body: some View {
        VStack {
            List {
                HStack {
                    Text("Poststed")
                    Spacer()
                    Button(colours[selection]) {
                        self.pickerVisible.toggle()
                    }
                    // .foregroundColor(self.pickerVisible ? .red : .blue)
                }
                if pickerVisible {
                    Picker(selection: $selection, label: Text("")) {
                        ForEach(0..<colours.count) {
                            Text(self.colours[$0]).foregroundColor(.secondary)
                        }
                    }
                    .onTapGesture {
                        self.pickerVisible.toggle()
                    }
                }
            }
        }
    }
}
