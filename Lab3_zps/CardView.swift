import SwiftUI

struct CardView: View {
    @State var isFlipped: Bool = false;
    @State var content: String = "";
    @Binding var theme: Theme;
    
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .frame(minWidth: 80, minHeight: 50)
            
                .overlay(
                    Text(content).font(.largeTitle)
                )
                .overlay(RoundedRectangle(
                    cornerRadius: 12
                ).stroke(theme.color, lineWidth: 2)
                ).overlay( RoundedRectangle(cornerRadius: 12).fill(theme.color).opacity(isFlipped ? 0 : 1)
                )
                .aspectRatio(CGSize(width:  2, height: 3), contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        }.onTapGesture {
            isFlipped.toggle();
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(theme: .constant(Theme(
            name: "Test",
            iconName: "Test",
            color: .blue,
            memoIcons: []))
        )
    }
}
