import SwiftUI



struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .padding(.horizontal, 131)
            .padding(.vertical, 13)
            .background(Color.button)
            .cornerRadius(20)
            .opacity(configuration.isPressed ? 0.4 : 1)
        
        
        
    }
    
    
    
}
