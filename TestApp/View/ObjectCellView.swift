//
//  ObjectCellView.swift
//  TestApp
//
//  Created by Шарап Бамматов on 06.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ObjectCellView: View {
    var object: Object

    var body: some View {
        HStack(spacing: 25) {
            WebImage(url: URL(string: object.image))
                .resizable()
                .frame(width: 120, height: 80)
                .scaledToFill()
                .cornerRadius(10)
            
            VStack(spacing: 10) {
                Text(object.name)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(object.description)
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .frame(height: 80)
    }
}

struct ObjectCellView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectCellView(object: Object.mockObject)
            .previewLayout(.sizeThatFits)
    }
}
