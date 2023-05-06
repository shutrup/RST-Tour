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
            ObjectView(color: .cyan10, objects: Object.mockObjects)
        }
    }
}

extension ObjectView {
    private var list: some View {
        List(objects.filter({ $0.color == color }), id: \.self) { object in
            ObjectCellView(object: object)
                .onTapGesture {
                    if UIApplication.shared.canOpenURL(URL(string:"dgis://")!) {
                        
                        UIApplication.shared.open(URL(string:"dgis://2gis.ru/routeSearch/rsType/car/from/<lon>,<lat>/to/\(object.lon),\(object.lat)")!)
                        
                    } else {
                        UIApplication.shared.open(URL(string:"https://itunes.apple.com/ru/app/id481627348?mt=8")!)
                    }
                }
        }
    }
}
