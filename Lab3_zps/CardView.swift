import SwiftUI

struct CardView: View {
    @State var isFlipped: Bool = false;
    @State var content: String = "";
    
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .frame(minWidth: 120, minHeight: 50)
            
                .overlay(
                    Text(content).font(.largeTitle)
                )
                .overlay(RoundedRectangle(
                    cornerRadius: 12
                ).stroke(.blue, lineWidth: 2)
                ).overlay( RoundedRectangle(cornerRadius: 12).fill(.blue).opacity(isFlipped ? 0 : 1)
                )
        }.onTapGesture {
            isFlipped.toggle();
        }
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
