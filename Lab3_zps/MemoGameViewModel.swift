import Foundation

class MemoGameViewModel : ObservableObject {
    
    static func createMemoryGame(with theme: Theme) -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfPairsOfCards: theme.memoIcons.count / 2) { pairIndex in
            theme.memoIcons[pairIndex]
        }
    }
    
    @Published private var model: MemoGameModel<String>
    @Published var currentTheme = THEMES[0];
    
    let themes: [Theme];
    
    init(themes: [Theme]) {
        self.themes = themes;
        self.model = MemoGameViewModel.createMemoryGame(with: themes[0])
    }
    
    var cards: [MemoGameModel<String>.Card] {
        model.cards;
    }

    func choose(card: MemoGameModel<String>.Card) {
        model.choose(card);
    }
    
    func shuffle() {
        model.shuffle();
    }
    
    func resetGame() {
        self.model = MemoGameViewModel.createMemoryGame(with: currentTheme);
    }
 
}
