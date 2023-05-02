//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Bradley Cox on 4/18/23.
//

import SwiftUI

/*
 MVVM Architecture
 Model - data point
 View - UI/screens
 View Model - manages models for view
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
