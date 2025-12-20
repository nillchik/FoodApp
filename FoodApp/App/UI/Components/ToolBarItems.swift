import SwiftUI

struct ToolBarComponents: View {
    
    let image: Image
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .fill(.white)
                .frame(width: 40, height: 40)
            image
                
                

            
            
        }
        
        
    }
    
    
}
