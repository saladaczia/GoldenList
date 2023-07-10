//
//  RowView.swift
//  GoldenList
//
//  Created by Maciej Sołoducha on 10/07/2023.
//

import SwiftUI

struct RowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
                .renderingMode(.original)
            Text(title)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(title: "First item")
    }
}
