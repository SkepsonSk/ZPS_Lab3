import SwiftUI

struct CardView: View {    
    let theme: Theme;
    let card: MemoGameModel<String>.Card;
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10.0).fill(.white).foregroundColor(.white);
                    RoundedRectangle(cornerRadius: 10.0).stroke(theme.color, lineWidth: 2)
                    Text(card.content).font(.system(size: 200)).minimumScaleFactor(0.01).aspectRatio(contentMode: .fit)
                } else if card.isMatched {
                    RoundedRectangle(cornerRadius: 10.0).fill(theme.color).opacity(0)
                } else {
                    RoundedRectangle(cornerRadius: 10.0).fill(theme.color)
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(theme: Theme(
            name: "Test",
            iconName: "Test",
            color: .blue,
            memoIcons: []),
                 card:  MemoGameModel<String>.Card(isFaceUp: false, content: "", id: 0)
        )
    }
}
