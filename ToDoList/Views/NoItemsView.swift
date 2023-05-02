//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Bradley Cox on 4/20/23.
//

import SwiftUI

struct NoItemsView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Your to do list is empty...")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Click the add button to add items to your list!")
                NavigationLink(destination: AddView(), label: {
                    Text("Add Item")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .multilineTextAlignment(.center)
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
