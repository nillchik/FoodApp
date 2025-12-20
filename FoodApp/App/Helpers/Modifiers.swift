
import SwiftUI

//MARK: Modifier for header

struct HelperHeaderModifier: ViewModifier {
    @Binding var isAddressHide: Bool
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        
        content
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        
                        dismiss()
                    }) {
                        
                        ToolBarComponents(image: Image(systemName: "chevron.left"))
                            .foregroundColor(.black)
                        
                        
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 10) {
                            
                            Text("Delivery to")
                            Button(action: {
                                
                                withAnimation {
                                    isAddressHide.toggle()
                                }
                                
                            }) {
                                
                                Image("down")
                                    .rotationEffect(Angle(degrees: isAddressHide ? 180 : 0))
                                
                            }
                        }
                        
                        Text("lekki phase 1, Estate")
                            .underline()
                            .frame(maxHeight: isAddressHide ? 0 : .infinity)
                            .opacity(isAddressHide ? 0 : 1)
                            .foregroundColor(Color("buttonColor"))
                            .clipped()
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    ToolBarComponents(image: Image(systemName: "person.fill"))
                    
                }
                
                
            }
            .toolbar(.hidden, for: .tabBar)
            .toolbarBackground(.hidden, for: .navigationBar)
            .onAppear {
                
                let apperance = UINavigationBarAppearance()
                apperance.shadowColor = .clear
                apperance.backgroundColor = UIColor(resource: .background)
                UINavigationBar.appearance().standardAppearance = apperance
                UINavigationBar.appearance().scrollEdgeAppearance = apperance
                UINavigationBar.appearance().compactAppearance = apperance
                UINavigationBar.appearance().compactScrollEdgeAppearance = apperance
                
            }
                
                
                
            }
        
        
    }

struct MainHeaderModifier: ViewModifier {
    @Binding var isAddressHide: Bool
    
    func body(content: Content) -> some View {
        
        content
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        
                    }) {
                        
                        ToolBarComponents(image: Image("menu"))
                        
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 10) {
                            
                            Text("Delivery to")
                            Button(action: {
                                
                                withAnimation {
                                    isAddressHide.toggle()
                                }
                                
                            }) {
                                
                                Image("down")
                                    .rotationEffect(Angle(degrees: isAddressHide ? 180 : 0))
                                
                            }
                        }
                        
                        Text("lekki phase 1, Estate")
                            .underline()
                            .frame(maxHeight: isAddressHide ? 0 : .infinity)
                            .opacity(isAddressHide ? 0 : 1)
                            .foregroundColor(Color("buttonColor"))
                            .clipped()
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    ToolBarComponents(image: Image(systemName: "person.fill"))
                    
                }
                
                
            } .toolbar(.hidden, for: .tabBar)
                
                
                
                
            }
        
        
    }
