//
//  HomeView.swift
//  TestApp
//
//  Created by Шарап Бамматов on 04.05.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var locationManager: LocationManager
    @ObservedObject var vm: HomeViewModel
    
    var body: some View {
        VStack {
            list
        }
        .navigationTitle("Категории")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView(locationManager: LocationManager(), vm: HomeViewModel.homeViewModel)
        }
    }
}

extension HomeView {
    @ViewBuilder private var list: some View {
        if let data = vm.recreationCenters {
            List(data.categories, id: \.self) { value in
                NavigationLink {
                    ObjectView(locationManager: locationManager, objects: data.objects, color: value.color)
                } label: {
                    HStack {
                        Text(value.name)
                            .font(.headline)
                            .bold()
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color(value.color.rawValue))
                            .frame(width: 30, height: 30)
                            .overlay {
                                Text("\(value.count)")
                            }
                    }
                }
            }
            .listStyle(.inset)
        }
    }
}
