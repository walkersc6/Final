//
//  ContentView.swift
//  final
//
//  Created by Sarah Walker on 12/16/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Environment(GoalViewModel.self) private var goalViewModel
    @SwiftDataViewModel var goalViewModel: GoalViewModel
    @Query private var goals: [Goal]

    var body: some View {
        @Bindable var viewModel = goalViewModel
        NavigationStack {
            List/*(selection: $goalViewModel.selectedGoal)*/ {
                ForEach(goals) { goal in
                    NavigationLink(goal.name, value: goal)
                }
                //                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Goals")
            .navigationDestination(for: Goal.self) { goal in
                GoalDetailView(goal: goal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                //                ToolbarItem {
                //                    Button(action: addItem) {
                //                        Label("Add Item", systemImage: "plus")
                //                    }
                //                }
            }
        }
//        } detail: {
//            GoalDetailView(goal)
//        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(goals[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
