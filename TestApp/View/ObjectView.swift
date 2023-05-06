//
//  ObjectView.swift
//  TestApp
//
//  Created by Шарап Бамматов on 06.05.2023.
//

import SwiftUI

struct ObjectView: View {
    var color: ColorName
    @State var objects: [Object]
    
    var body: some View {
        VStack {
            list
        }
        .listStyle(.inset)
        .navigationTitle("Объекты")
    }
}

struct ObjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ObjectView(color: .cyan10, objects: Object.mockObject)
        }
    }
}

extension ObjectView {
    private var list: some View {
        List(objects.filter({ $0.color == color }), id: \.self) { value in
            Text(value.name)
        }
    }
}
