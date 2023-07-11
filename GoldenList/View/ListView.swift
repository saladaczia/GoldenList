//
//  ListView.swift
//  GoldenList
//
//  Created by Maciej Sołoducha on 10/07/2023.
//

import SwiftUI

struct ListView: View {
    
    // Environment listViewModel
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        ZStack {
            // Show Introview if items array is empty
            if listViewModel.items.isEmpty {
                IntroView()
                    .padding(.top, 50)
            } else {
                // Show item list if array is't empty
                List {
                    // Show items from array
                    ForEach(listViewModel.items) { item in
                        RowView(item: item)
                            .onTapGesture {
                                withAnimation {
                                    // Check and uncheck mark in row
                                    listViewModel.doneItem(item: item)
                                }
                            }
                    }
                    .onDelete { indexSet in
                        listViewModel.deleteItem(indexSet)
                    }
                    .onMove { index, newOffset in
                        listViewModel.moveItem(index, newOffset)
                    }
                }
            }
        }
        .navigationTitle("Golden List")
        .toolbar {
            // leading button in navigation view
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
                
            }
            // trailing button in navigation view
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
