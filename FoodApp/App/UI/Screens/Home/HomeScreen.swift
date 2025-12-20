
import SwiftUI

struct HomeScreen: View {
    @State private var isAddressHide: Bool = false
    @Environment(CategoryViewModel.self) var viewModel
    @State private var isViewAllScreen = false
    @State private var selectedRestaraunt: Restaraunts? = nil
    @Binding var isTabBarVisible: Bool
    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Enjoy Delicious food")
                    .font(Font.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    CategoryView()
                    
                    
                    
                }
                
                PopularRestaraunts(selectedRestaraunt: $selectedRestaraunt, action: { isViewAllScreen = true })
                

            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .environment(viewModel)
                .fullScreenCover(isPresented: $isViewAllScreen) {
                    
                    Text("View all Screen")
                    
                }
            .padding(.horizontal, 21)
            .background(Color(.background))
            .makeMainHeader(isAddressHiden: $isAddressHide)
            .navigationDestination(item: $selectedRestaraunt ) { restaraunt in
                
                DetailScreen(restaraunt: restaraunt, isTabBarVisible: $isTabBarVisible)
                    .toolbar(.hidden, for: .tabBar)
            }
        }
    }

#Preview {
    HomeScreen(isTabBarVisible: .constant(true))
        .environment(CategoryViewModel())
}


private struct CategoryView: View {
    
    @Environment(CategoryViewModel.self) private var viewModel
    var body: some View {
        
        HStack(spacing: 0) {
            
            ForEach(viewModel.categories) { category in
                
                CategoryButton(category: category, isSelected: viewModel.selectedCategory == category, action: {
                    
                    viewModel.selectedCategory = category
                })
                
                
            }
            
            
        } .padding(.bottom, 50)
        
        
    }
    
}

private struct CategoryButton: View {
    
    let category: FoodCategory
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            
            ZStack {
                Capsule()
                    .fill(.white)
                    .stroke(Color(category.themeColor), lineWidth: 2)
                    .frame(minWidth: 87, minHeight: 109)
                Capsule()
                    .fill(isSelected ? category.themeColor : .white)
                    .frame(width: 65, height: 85)
                
                VStack(spacing: 9) {
                    Image(category.icons)
                        .resizable()
                        .frame(width: 26, height: 26)
                    Text(category.rawValue)
                        .foregroundColor(.black)
                        .fontWeight(.regular)
                        .font(Font.system(size: 12))
                }
                
            } .padding(.trailing, 22)
                .fixedSize()
            
        }
        
    }
    
}

private struct PopularRestaraunts: View {
    @Environment(CategoryViewModel.self) private var viewModel
    @Binding var selectedRestaraunt: Restaraunts?
    let action: () -> Void
    var body: some View {
        
            
            HStack(spacing: 0) {
                
                Text("Popular restaurants")
                Spacer()
                Button(action: {
                    
                    action()
                    
                }) {
                    
                    
                    Text("View all \(viewModel.sumOfProducts)")
                        .foregroundColor(viewModel.isFilterEmpty ? .gray : .red)
                        .underline()
                    
                    
                    
                } .disabled(viewModel.isFilterEmpty)
                
            }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 50) {
                if viewModel.categoriesFilter.isEmpty {
                    
                    ContentUnavailableView {
                        
                        Label("Restaurants not found", systemImage: "exclamationmark.warninglight.fill")
                    
                    } description: {
                        Text("Try to selecting another category")
                    } .frame(maxWidth: .infinity)
                    
                } else {
                    ForEach(viewModel.categoriesFilter) { restaraunt in
                        
                        RestaurantsCard(restaraunt: restaraunt, action: { selectedRestaraunt = restaraunt })
                        
                        
                    }
                }
                
                
            }
        }
        
        
    }
    
    
}

private struct RestaurantsCard: View {
    
    let restaraunt: Restaraunts
    let action: () -> Void
    
    var body: some View {
        
        
        Button(action: {
            
            action()
            
        }) {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(.white)
                    .frame(width: 190, height: 230)
                    .layoutPriority(1)
                VStack(alignment: .leading, spacing: 0) {
                    
                    Image(restaraunt.image)
                        .resizable()
                        .frame(width: 170, height: 112)
                    Text(restaraunt.name)
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                        .padding(.top, 20)
                        .foregroundColor(.black)
                    Text(restaraunt.miniDescription)
                        .foregroundColor(.black)
                        .lineSpacing(3)
                        .frame(minHeight: 30)
                        .font(Font.system(size: 12))
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 0) {
                        
                        Image(.star)
                        Text(restaraunt.rating)
                            .padding(.leading, 3)
                            .foregroundColor(.black)
                            .font(Font.system(size: 12))
                        Spacer()
                        Image(.like)
                        
                            .padding(.trailing, 24)
                        
                        
                    } .padding(.top, 13)
                    
                } .padding(.leading, 15)
                
                
                
            } .padding(.top, 40)
                
                    
                
                
                
        }
        
    }
    
    
    
    
}

