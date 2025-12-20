
import SwiftUI

//MARK: ColorResource to Color
extension FoodCategory {
    
    var themeColor: Color {
        
        Color(self.borderColor)
        
        
    }
    
    
    
}

//MARK: Main Header





extension View {
    
    func makeMainHeader(isAddressHiden: Binding<Bool>) -> some View {
        
        self.modifier(MainHeaderModifier(isAddressHide: isAddressHiden))
        
        
    }
    
    
    
}


//MARK: Helper Header

extension View {
    
    func makeHelperHeader(isAddressHiden: Binding<Bool>) -> some View {
        
        self.modifier(HelperHeaderModifier(isAddressHide: isAddressHiden))
        
        
        
        
    }
}
