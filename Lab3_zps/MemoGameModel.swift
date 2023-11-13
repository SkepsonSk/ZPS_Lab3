import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card];
    private var indexOfTheOneFaceUpCard: Int?;
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [];
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex);
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2-1))
        }
    }
    
    mutating func choose(_ card: Card) {
        
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
         
            if let potentialMatchIndex = indexOfTheOneFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true;
                    cards[potentialMatchIndex].isMatched = true;
                }
                indexOfTheOneFaceUpCard = nil;
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false;
                }
                indexOfTheOneFaceUpCard = chosenIndex;
            }
            
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    mutating func shuffle() {
        for index in cards.indices {
            cards[index].isMatched = false;
            cards[index].isFaceUp = false;
        }
        cards.shuffle()
    }
    
    struct Card : Identifiable {
        var isFaceUp: Bool = false;
        var isMatched: Bool = false;
        
        let content: CardContent;
        let id: Int;
    }
    
}
