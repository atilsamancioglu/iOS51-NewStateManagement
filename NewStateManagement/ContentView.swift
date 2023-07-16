//
//  ContentView.swift
//  NewStateManagement
//
//  Created by Atil Samancioglu on 16.07.2023.
//
import SwiftUI
import SwiftData

@Observable
class DarkTheme {
    var isEnabled: Bool = false
}

struct DarkChoiceView: View {
    
    @Bindable var darkTheme: DarkTheme
    
    var body: some View {
           Toggle(isOn: $darkTheme.isEnabled) {
               EmptyView()
           }.fixedSize()
       }
}

struct DarkChoiceToggleView: View {
    
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        DarkChoiceView(darkTheme: darkTheme)
    }
    
}

struct InformationText: View {
    
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        
        Text(darkTheme.isEnabled ? "Dark Theme Enabled" : "Dark Theme Not Enabled")
            .font(.title)
            .foregroundStyle(darkTheme.isEnabled ? .white : .black)
        
    }
}

struct ContentView: View {
    
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        VStack {
            DarkChoiceToggleView()
            InformationText()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(darkTheme.isEnabled ? .black: .white)
    }
}

#Preview {
    ContentView()
        .environment(DarkTheme())
}
