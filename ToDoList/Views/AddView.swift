//
//  AddView.swift
//  ToDoList
//
//  Created by Bradley Cox on 4/18/23.
//

import SwiftUI
import MessageUI

struct AddView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var titleText: String = ""
    @State var descText: String = ""
    @State var dueDate: Date = Date()
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State private var sendEmail: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Title...", text: $titleText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .cornerRadius(10)
                
                TextField("Description...", text: $descText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .cornerRadius(10)
                
                DatePicker("Due Date", selection: $dueDate, displayedComponents: [.date])
                
                Toggle("Send reminder email?", isOn: $sendEmail)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .sheet(isPresented: $sendEmail) {
                            MailView(content: "Due Date: \(dueDate)\n\n \(descText)", to: "bradleycox1995@gmail.com", subject: titleText)
                        }
                })
            }
            .padding(15)
        }
        .navigationTitle("Add a List Item ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if fieldNotEmpty(text: titleText) {
            listViewModel.addItem(title: titleText, desc: descText, dueDate: dueDate)

            dismiss()
        }
    }
    
    func fieldNotEmpty(text: String) -> Bool {
        if text.count == 0 {
            alertTitle = "Title field must not be empty..."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
