
import SwiftUI

enum MainFlowRoute: Hashable {
    
    case home
    case heart
    case search
    case notification
    case cart
    
}

struct MainFlow: View {
    @State private var currentTab: MainFlowRoute = .home
    @State var showTabBar: Bool = true
    @State private var detailVM = DetailScreenViewModel()
    @State private var categoryVM = CategoryViewModel()
    
    private let tabButtons: [TabBarButtonData] = [
        TabBarButtonData(image: .home, tab: .home),
        TabBarButtonData(image: .heart, tab: .heart),
        TabBarButtonData(image: .search, tab: .search),
        TabBarButtonData(image: .notification, tab: .notification),
        TabBarButtonData(image: .buy, tab: .cart)
    ]
    var body: some View {
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                NavigationStack {
                    HomeScreen(isTabBarVisible: $showTabBar)
                        .tag(MainFlowRoute.home)
                }
                    Text("heart")
                        .tag(MainFlowRoute.heart)
                    Text("search")
                        .tag(MainFlowRoute.search)
                    Text("notification")
                        .tag(MainFlowRoute.notification)
                CartScreen()
                    
                    .tag(MainFlowRoute.cart)
            } .environment(detailVM)
                .environment(categoryVM)
                
            }
            if showTabBar {
                TabBar(currentTab: $currentTab, buttons: tabButtons)
            }
            
        }
        
        
    }

private struct TabBar: View {
    @Binding var currentTab: MainFlowRoute
    let buttons: [TabBarButtonData]
    
    var body: some View {
        
        HStack(spacing: 35) {
            
            ForEach(buttons, id: \.self) { button in
                
                let style: TabBarButtonStyle = (currentTab == button.tab ? .active : .unactive )
                
                TabBarButton(currentTab: $currentTab, style: style, data: button)
                
            }  .frame(maxWidth: .infinity)
                .padding(.bottom, 5)
                .padding(.top, 10)
                
           
            
        }
        .padding(.horizontal, 40)
        
        .background {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
                .ignoresSafeArea(.container, edges: .bottom)
            
        }
            
            
    }
    
    
}

private struct TabBarButtonData: Hashable {
    
    
    let image: ImageResource
    let tab: MainFlowRoute

    
}

private struct TabBarButtonStyle {
    
    let foregroundColor: Color
    
    static let active = TabBarButtonStyle(foregroundColor: .button)
    static let unactive = TabBarButtonStyle(foregroundColor: .gray)
    
    
}


private struct TabBarButton: View {
    @Binding var currentTab: MainFlowRoute
    let style: TabBarButtonStyle
    let data: TabBarButtonData
    
    var body: some View {
        
        Button(action: {
            
            withAnimation {
                currentTab = data.tab
            }
            
        }) {
            
            Image(data.image)
            
                .renderingMode(.template)
                .foregroundStyle(style.foregroundColor)
            
        }
        
        
    }
    
    
}

#Preview {
    MainFlow()
}
