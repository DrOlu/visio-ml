//
//  ViewerPanel.swift
//  VisioAnnotate
//
//  Created by dl on 2020-07-02.
//  Copyright © 2020 Gaspard+Bruno. All rights reserved.
//

import SwiftUI

struct ViewerPanel: View {
  
  @ObservedObject var appData = AppData.shared

  var body: some View {
    VStack(spacing: 0) {
      if appData.workingFolder == nil {
        VStack {
          Text("Please select a working folder to begin.")
          OpenButton()
        }
      } else if appData.activeImage != nil && appData.activeImage!.fileExists {
        ImageViewer(image: $appData.annotatedImages[appData.activeImageIndex!], scaleFactor: appData.currentScaleFactor!)
      } else if appData.activeImage != nil && !appData.activeImage!.fileExists {
        Text("Image file currently not present in file system.")
        .foregroundColor(.secondary)
      } else {
        Text("No image selected")
        .foregroundColor(.secondary)
      }
    }
    .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
    .background(Color(NSColor.textBackgroundColor))
  }
}

struct ViewerPanel_Previews: PreviewProvider {
  static var previews: some View {
    ViewerPanel()
  }
}
