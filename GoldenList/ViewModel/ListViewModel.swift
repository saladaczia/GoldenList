//
//  ListViewModel.swift
//  GoldenList
//
//  Created by Maciej Sołoducha on 11/07/2023.
//

import Foundation


class ListViewModel: ObservableObject {
    
    // Publiched items array
    @Published var items: [ItemsModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    // Initiation loading items
    init() {
     loadItems()
    }
    
    // Decode and load items from user defaults
    func loadItems() {
        guard let data = UserDefaults.standard.data(forKey: "itemsList"), let savedItems = try? JSONDecoder().decode([ItemsModel].self, from: data) else {
            return
        }
        // input decode data to items array
        self.items = savedItems
    }
    
    // Delete item from array
    func deleteItem(_ indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // Moving item on array
    func moveItem(_ from: IndexSet, _ to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // Add new item to array using model
    func addItem(title: String) {
        let newItem = ItemsModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    // Edit checkmark when task is done or not
    func doneItem(item: ItemsModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = ItemsModel(title: item.title, isCompleted: !item.isCompleted)
        }
    }
    
    // Save items from array to user defaults using encode json
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "itemsList")
        }
    }
}
