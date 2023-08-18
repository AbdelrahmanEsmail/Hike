//
//  CustomListRowView.swift
//  Hike
//
//  Created by Abdelrahman Esmail on 18/08/2023.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        // ADVANCED LABELED CONTENT
        LabeledContent{
            // CONTENT
            if rowContent != nil {
                Text(rowContent!).foregroundColor(.primary).fontWeight(.heavy)
            }
            else if(rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!).foregroundColor(.pink).fontWeight(.heavy)
            }
            
            else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }label: {
            // LABEL
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width:30,height: 30).foregroundColor(rowTintColor)
                    Image(systemName: rowIcon).foregroundColor(.white).fontWeight(.semibold)
                }
                Text(rowLabel)
            }
            
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        List() {
            CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent:"Abdo Esmail", rowTintColor: .pink,rowLinkLabel: "Elawady Website", rowLinkDestination: "https://elawady.works")
        }
    }
}
