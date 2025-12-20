

import SwiftUI

struct CartScreen: View {
    @Environment(DetailScreenViewModel.self) var viewModel
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            if viewModel.cart.isEmpty {
                ContentUnavailableView {
                    
                    Label("Cart is empty", systemImage: "cart.fill.badge.questionmark.rtl")
                    
                }
            } else {
                
                Cart(cartItems: viewModel.cart)
                
                
                
                
                
            }
            
        }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}


private struct Cart: View {
    @Environment(DetailScreenViewModel.self) var viewModel
    let cartItems: [CartItem]
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Your cart")
                .fontWeight(.bold)
                .font(Font.system(size: 24))
                .padding(.bottom, 40)
            List {
                ForEach(cartItems) { item in
                    HStack(spacing: 0) {
                        
                        Image(item.image)
                            .resizable()
                            .frame(width: 69, height: 45)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(item.restarauntName)
                            Text(item.totalPrice, format: .currency(code: "USD"))
                                .foregroundColor(.button)
                                .fontWeight(.bold)
                        }
                        
                        
                        Spacer()
                        ChangeCountButton(cartItem: item)
                        
                    } .swipeActions(edge: .trailing) {
                        
                        Button(role: .destructive) {
                            withAnimation {
                                
                                viewModel.deleteItem(for: item)
                            }
                            
                        } label: {
                            
                            Label("Delete", systemImage: "trash")
                            
                        }
                    }
                }
            }.listStyle(.plain)
                    
                Spacer()
                HStack(spacing: 0) {
                    Text("Total Price")
                    Spacer()
                    Text(viewModel.allPrice, format: .number.precision(.fractionLength(2)))
                } .padding(.bottom, 50)
            }
            
        }
        
    
    
}

#Preview {
    CartScreen()
        .environment(DetailScreenViewModel())
}

private struct ChangeCountButton: View {
    
    @Environment(DetailScreenViewModel.self) var viewModel
    let cartItem: CartItem
    
    var body: some View {
        
        
        HStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(.button)
                    .frame(width: 24, height: 24)
                Button(action: {
                    
                    viewModel.removeCount(for: cartItem)
                    
                }) {
                    
                    Text("-")
                    
                    
                }
                
            }
            
            Text(String(cartItem.count))
                .foregroundColor(.black)
            
            ZStack {
                Circle()
                    .fill(.button)
                    .frame(width: 24, height: 24)
                Button(action: {
                    
                    viewModel.increaseCount(for: cartItem)
                    
                }) {
                    
                    Text("+")
                    
                    
                }
                
            }
        } .foregroundColor(.white)
            .padding(.leading, 22)
        
    }
}
