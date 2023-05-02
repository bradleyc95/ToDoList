//
//  ListRowView.swift
//  ToDoList
//
//  Created by Bradley Cox on 4/18/23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")                .foregroundColor(item.isCompleted ? .green : .red)
                Text(item.title)
                Spacer()
            }
            .font(.title2)
            .padding(.vertical, 8)
            
            HStack {
                Text("Due Date: \(item.dueDate, style: .date)")
                Spacer()
            }
            .padding(.vertical, 8)
            
            HStack {
                Text(item.desc)
                Spacer()
            }
            
            
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Item", isCompleted: true)
    static var item2 = ItemModel(title: "Second Item", isCompleted: false)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
