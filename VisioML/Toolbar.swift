import SwiftUI

struct Toolbar: View {
  
  @ObservedObject var appData = AppData.shared

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        WorkingFolderIndicator()
        Button("JSON Export") {
          self.appData.saveJSON()
        }
        .environment(\.isEnabled, appData.workingFolder != nil)
      }
      Spacer()
      Button("Synthetics…") {
        withAnimation {
          self.appData.navigation.currentModal = "synthetics"
        }
      }
      .environment(\.isEnabled, appData.workingFolder != nil && appData.pendingImages == 0)
      Button("Navigator") {
        withAnimation {
          self.appData.toggleNavigator()
        }
      }
      .environment(\.isEnabled, appData.workingFolder != nil)
    }
    .padding()
    .frame(height: 80)
    .frame(maxWidth: .infinity)
    .border(Color(NSColor.separatorColor), width: 1)
  }
}

struct Toolbar_Previews: PreviewProvider {
  static var previews: some View {
    Toolbar()
  }
}