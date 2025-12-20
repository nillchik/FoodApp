import SwiftUI

struct DetailScreen: View {
    let restaraunt: Restaraunts
    @State private var isAddressHiden = false
    @Environment(DetailScreenViewModel.self) var viewModel
    @Binding var isTabBarVisible: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment:.center, spacing: 0) {
                
                ScrollView {
                    
                    ZStack(alignment: .center) {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(width: 258, height: 224)
                        Image(restaraunt.image)
                            .resizable()
                            .frame(width:229, height: 150)
                    } .padding(.bottom, 35)
                    
                    ZStack(alignment: .center) {
                        
                        RoundedRectangle(cornerRadius: 30)
                            .fill(.button)
                            .frame(width: 100, height: 50)
                        HStack(spacing: 20) {
                            Button(action: {
                                
                                viewModel.addProduct()
                                
                            }) {
                                
                                Text("+")
                                
                                
                            }
                            
                            Text("\(viewModel.count)")
                            
                            Button(action: {
                                
                                
                                viewModel.removeProduct()
                                
                            }) {
                                
                                Text("-")
                                
                            }
                            
                            
                        } .foregroundColor(.white)
                        
                        
                        
                        
                    } .padding(.bottom, 35)
                    
                    Text("Big boys Cheese burger")
                        .font(Font.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    HStack(spacing: 30) {
                        
                        HStack(spacing: 5) {
                            Image(.star)
                            Text(restaraunt.rating)
                        }
                        Text(restaraunt.callories)
                        Text(restaraunt.cookingTime)
                        
                        
                    } .padding(.bottom, 35)
                    VStack(alignment: .leading, spacing: 0) {
                        Text(restaraunt.descritption)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 37)
                            .padding(.leading, 36)
                            .padding(.trailing, 20)
                        
                        Text("Toppics For You")
                            .padding(.bottom, 22)
                            .font(Font.system(size: 16))
                            .fontWeight(.bold)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            
                            
                            HStack(spacing: 20) {
                                
                                
                                
                                
                                ForEach(restaraunt.category.topicsForYou) { topic in
                                    
                                    TopicAddButton(topic: topic)
                                    
                                    
                                    
                                }
                                
                                
                                
                                
                                Spacer()
                                
                            }
                            
                        }
                    } .padding(.leading, 23)
                    
                }
                AddToCartButton(action: {viewModel.addToCart(restaraunt: restaraunt)}, dismiss: { dismiss() })
                   
            } .makeHelperHeader(isAddressHiden: $isAddressHiden)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                
                .environment(viewModel)
            
            
                .navigationBarBackButtonHidden()
                .onAppear {
                    
                    isTabBarVisible = false
                    
                }
                .onDisappear {
                    
                    isTabBarVisible = true
                    
                }
        }
    }
}
private struct TopicAddButton: View {
    
    let topic: Topic

    @Environment(DetailScreenViewModel.self) var viewModel
    var body: some View {
    
        Button(action: {
            withAnimation {
                
                viewModel.topicToogle(topic)
                
            }
                        
        }) {
            
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(.white)
                    .stroke(viewModel.selectedTopics.contains(topic) ? .button : .white)
                    .frame(width: 130, height: 54)
                    .layoutPriority(1)
                HStack(spacing: 6) {
                    Image(topic.image)
                        .padding(.leading, 13)
                    
                    Text(topic.name)
                        .foregroundColor(.black)
                }
                
            }
            
            
            
        }
        
        
        
    }
    
    
    
}

private struct AddToCartButton: View {
    
    @Environment(DetailScreenViewModel.self) var viewModel
    let action: () -> Void
    let dismiss: () -> Void
    
    var body: some View {
        
        Button(action: {
            
            action()
            dismiss()
            
            
        }) {
            
            
            Text("Add to cart")
                
                
            
            
        } .buttonStyle(PrimaryButtonStyle())
            .padding(.bottom, 31)
        
            
        
        
        
        
    }
    
    
    
}


#Preview {
    DetailScreen(restaraunt: Restaraunts(name: "pizza", price: 200, image: "cheeseburger", miniDescription: "pizza", rating: "4.5", callories: "4000 ⏰", cookingTime: "312312", descritption: "", category: .burger), isTabBarVisible: .constant(false))
}








