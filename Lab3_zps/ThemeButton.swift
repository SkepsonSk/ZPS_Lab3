import SwiftUI

struct ThemeButton: View {
    @Binding var currentTheme: Theme;
    @Binding var theme: Theme;
    
    var body: some View {
        VStack {
            Image(systemName: currentTheme.iconName)
                .font(.system(size: 32))
                .foregroundColor(currentTheme.color)
            Text(theme.name)
                .foregroundColor(currentTheme.color)
        }.onTapGesture {
            currentTheme = theme;
            currentTheme.memoIcons.shuffle();
        }
    }
}

#Preview {
    ThemeButton(currentTheme: .constant(Theme(name: "Theme", iconName: "square.and.pencil", color: .blue, memoIcons: [])), theme: .constant(Theme(name: "Theme", iconName: "square.and.pencil", color: .blue, memoIcons: [])))
}
