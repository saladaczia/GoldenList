//
//  IntroView.swift
//  GoldenList
//
//  Created by Maciej Sołoducha on 11/07/2023.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        
        VStack {
            
            // Title
            Text("Your list is empty ☹️")
                .font(.title)
            .fontWeight(.semibold)
            
            // Description
            Text("Add a new item to your list.")
                .padding()
            
            // Button with destination to AddView
            NavigationLink {
                AddView()
            } label: {
                Text("Add new item")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 140,height: 40)
                    .background(Color.accentColor)
                    .cornerRadius(15)
            }
            Spacer()
        }
    }
}


struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IntroView()
        }
    }
}
