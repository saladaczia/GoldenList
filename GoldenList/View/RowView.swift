//
//  RowView.swift
//  GoldenList
//
//  Created by Maciej Sołoducha on 10/07/2023.
//

import SwiftUI

struct RowView: View {
    
    // Constant with item from ItemModel
    let item: ItemsModel
    
    var body: some View {
        // Row in List
        HStack {
            // Checkmark image
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .renderingMode(.original)
            // Text with user item
            Text(item.title)
        }
    }
    
}

struct RowView_Previews: PreviewProvider {
    // Sample item text
    static var itemSample = ItemsModel(title: "first", isCompleted: true)
    
    static var previews: some View {
        RowView(item: itemSample)
    }
}
