//
//  SettingsView.swift
//  Hike
//
//  Created by Abdelrahman Esmail on 18/08/2023.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - SECTION: PROPERTIES
    private let alternateAppIcons: [String] = ["AppIcons-Backpack","AppIcons-Camera","AppIcons-Campfire","AppIcons-MagnifyingGlass","AppIcons-Map","AppIcons-Mushroom"]
    var body: some View {
        List{
            // MARK: - SECTION: HEADER
            HStack {
                Spacer()
                Image(systemName: "laurel.leading").font(.system(size: 80,weight: .black))
                VStack (spacing: -10){
                    Text("Hike").font(.system(size: 66,weight: .black))
                    Text("Editors' Choice").fontWeight(.medium)
                }
                Image(systemName: "laurel.trailing").font(.system(size: 80,weight: .black))
                Spacer()
            }.foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom)).padding(.top,8)
            
            VStack(spacing: 8) {
                Text("Where can you find? \nperfect tracks?").font(.title2).fontWeight(.heavy)
                Text("The hike which look gorgeous but is even better once you are actually there. the hike that you hope to do again someday. \nFind the best day hikes in the app.").font(.footnote).italic()
                Text("Dust off the boots! It's time for a walk").fontWeight(.heavy).foregroundColor(.customGreenMedium)
            }.multilineTextAlignment(.center)
                .padding(.bottom,16).frame(maxWidth: .infinity)

            // MARK: - SECTION: ICONS
            Section(header:Text("Alternate Icons"))
            {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(alternateAppIcons.indices,id: \.self) { item in
                            Button{
                                print("Icon \(alternateAppIcons[item]) was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item])
                                {error in
                                    if error != nil {
                                        print("Failed request to update the app's icon \(String(describing: error?.localizedDescription))")
                                    }else{
                                        print("Success! You have changed the app's icon to \(alternateAppIcons[item])'")
                                    }
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Preview").resizable().scaledToFit().frame(width: 80,height: 80).cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }.padding(.top,12)
                Text("Choose your favorite app icon from the collection above.").frame(minWidth: 0, maxWidth: .infinity).multilineTextAlignment(.center).foregroundColor(.secondary).font(.footnote).padding(.bottom,12)
            }.listRowSeparator(.hidden)
            // MARK: - SECTION: ABOUT
            Section(header: Text("ABOUT THE APP"), footer: HStack{
                Spacer()
                Text("Copyright All right reserved.")
                Spacer()
            }.padding(.vertical,8) )
            {
                // ADVANCED LABELED CONTENT
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Abdo Esmail", rowTintColor: .mint)
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo,rowLinkLabel: "Elawady Website", rowLinkDestination: "https://elawady.works")
            }
            
        }//: LIST
        .listRowSeparator(.hidden)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
