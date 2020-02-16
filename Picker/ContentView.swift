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

struct MultiPicker: View  {

    typealias Label = String
    typealias Entry = String

    let data: [ (Label, [Entry]) ]
    @Binding var selection: [Entry]

    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(0..<self.data.count) { column in
                    Picker(self.data[column].0, selection: self.$selection[column]) {
                        ForEach(0..<self.data[column].1.count) { row in
                            Text(verbatim: self.data[column].1[row])
                            .tag(self.data[column].1[row])
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: geometry.size.width / CGFloat(self.data.count), height: geometry.size.height)
                    .clipped()
                }
            }
        }
    }
}

struct ContentViewW: View {

    @State var data: [(String, [String])] = [
        ("One", Array(0...10).map { "\($0)" }),
        ("Two", Array(20...40).map { "\($0)" }),
        ("Three", Array(100...200).map { "\($0)" })
    ]
    @State var selection: [String] = [0, 20, 100].map { "\($0)" }

    var body: some View {
        VStack(alignment: .center) {
            Text(verbatim: "Selection: \(selection)")
            MultiPicker(data: data, selection: $selection).frame(height: 300)
        }
    }

}

