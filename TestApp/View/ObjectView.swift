//
//  ObjectView.swift
//  TestApp
//
//  Created by Шарап Бамматов on 06.05.2023.
//

import SwiftUI

struct ObjectView: View {
    @ObservedObject var locationManager: LocationManager
    @State var objects: [Object]
    var color: ColorName
    
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
            ObjectView(locationManager: LocationManager(), objects: Object.mockObjects, color: .cyan10)
        }
    }
}

extension ObjectView {
    private var list: some View {
        List(objects.filter({ $0.color == color }), id: \.self) { object in
            ObjectCellView(object: object)
                .onTapGesture {
                    if UIApplication.shared.canOpenURL(URL(string:"dgis://")!) {
                        
                    if let location = locationManager.lastLocation?.coordinate {
                            UIApplication.shared.open(URL(string:"dgis://2gis.ru/routeSearch/rsType/car/from/\(location.longitude),\(location.latitude)/to/\(object.lon),\(object.lat)")!)
                        }
                        
                    } else {
                        UIApplication.shared.open(URL(string:"https://itunes.apple.com/ru/app/id481627348?mt=8")!)
                    }
                }
        }
    }
}
