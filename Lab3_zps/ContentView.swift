import SwiftUI
import CoreData

struct ContentView: View {

    @ObservedObject var viewModel: MemoGameViewModel;
    @State private var currentTheme: Theme = THEMES[0]
    
/*    func addCards() {
        let currentIndex = cards.count
        if currentIndex < CARD_CONTENT.count{
            let endIndex = min(currentIndex+2, CARD_CONTENT.count)
            cards.append(contentsOf: CARD_CONTENT[currentIndex..<endIndex])
        }
    }
    
   func removeCards() {
        if cards.count > 2 {
            cards.removeLast(2)
        }
    }
    
    var addCard: some View {
        return adjustCardNumber(by: 2, symbol: "Add")
    }
    
    var removeCard: some View {
        return adjustCardNumber(by: -2, symbol: "Remove")
    }*/
    
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
            cardDisplay
            Button("Shuffle") {
                withAnimation() {
                    viewModel.shuffle();
                }
            }.font(.title3).padding().foregroundColor(viewModel.currentTheme.color)
            themes
        }
    }

/*    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        if offset > 0 {
            return Button(action: addCards) {
                Text(symbol)
            }.disabled(cards.count == CARD_CONTENT.count)

        }
        else {
            return Button(action: removeCards) {
                Text(symbol)
            }.disabled(cards.count == 2)
        }
    }*/
    
    func getThemeButton(theme: Theme) -> some View {
        return ThemeButton(theme: theme, color: viewModel.currentTheme.color) {
            withAnimation(.easeInOut) {
                viewModel.currentTheme = theme;
                viewModel.shuffle();
            }
        }
    }
    
    var themes: some View {
        HStack {
            ForEach(viewModel.themes, id: \.name) { theme in
                getThemeButton(theme: theme)
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    var cardDisplay: some View{
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 0, content: {
                ForEach(viewModel.cards){ card in
                    CardView(
                        theme: viewModel.currentTheme,
                        card: card
                    )
                    .aspectRatio(3/4, contentMode: .fit)
                    .padding([.bottom, .trailing, .top], 5)
                    .onTapGesture {
                        withAnimation {
                            viewModel.choose(card: card)
                        }
                    }
                }
            }).padding().foregroundColor(Color.blue)
        }
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            viewModel: MemoGameViewModel(themes: THEMES)
        )
    }
}
