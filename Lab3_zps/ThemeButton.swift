import Foundation
import SwiftUI

struct ThemeButton: View {
    var theme: Theme;
    var color: Color;
    var action: () -> Void;
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: theme.iconName)
                    .font(.system(size: 32))
                Text(theme.name).font(.title3)
            }.foregroundColor(color)
        }
    }
}

#Preview {
    ThemeButton(theme: THEMES[0], color: .blue, action: {
        print("Test");
    })
}
