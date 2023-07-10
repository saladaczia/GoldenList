//
//  ListView.swift
//  GoldenList
//
//  Created by Maciej Sołoducha on 10/07/2023.
//

import SwiftUI

struct ListView: View {
    
    var body: some View {
        
        // List
        List {
            RowView(title: "First item")
        }
        .navigationTitle("Golden List")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
