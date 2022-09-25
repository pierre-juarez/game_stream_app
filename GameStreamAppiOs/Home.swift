//
//  Home.swift
//  GameStreamAppiOs
//
//  Created by Tech Fitco on 15/06/22.
//

import SwiftUI

struct Home: View {
    @State var tabSelected:Int = 2
    var body: some View {
      
      
      TabView (selection: $tabSelected){
        
        Text("Perfil")
          .font(.system(size: 30, weight: .bold, design: .rounded))
          .tabItem{
            Image(systemName: "person")
            Text("Perfil")
          }.tag(0)
        
        Text("Juegos")
          .font(.system(size: 30, weight: .bold, design: .rounded))
          .tabItem{
            Image(systemName: "gamecontroller")
            Text("Juegos")
          }.tag(1)
        
        ScreenHone()
          .tabItem{
            Image(systemName: "house")
            Text("Inicio")
          }.tag(2)
        
        Text("Favoritos")
          .font(.system(size: 30, weight: .bold, design: .rounded))
          .tabItem{
            Image(systemName: "heart")
            Text("Favoritos")
          }.tag(3)
        
      }
      .accentColor(Color("White"))
    }
  
  init(){
    UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
    
    print("Iniciando las vistas del Home...")
    
  }
  
}

struct ScreenHone:View{
  @State var textSearch = ""
  var body: some View{
    
    ZStack{
      
      Color("BackgroundColor").ignoresSafeArea()
      
      VStack{
        Image("LogoGameStream")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width:187)
          .padding(.horizontal,11)
        
        HStack{
          
          Button(action: searchVideo, label: {
            Image(systemName: "magnifyingglass")
              .foregroundColor(textSearch.isEmpty ? Color(.yellow) : Color("PrimaryColor"))
          })
          
          ZStack(alignment: .leading){
            if textSearch.isEmpty{
              Text("Busca un vídeo")
                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
            }
            
            TextField("", text: $textSearch)
              .foregroundColor(Color("White"))
            
          }
          
        }
        .padding([.leading,.top,.bottom],11.0)
        .background(Color("ButtonNetworksColor"))
        .clipShape(Capsule())
          
      }.padding(.horizontal,18)
      
    }.navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
    
  }
  
  func searchVideo(){
    print("Searching video...\(textSearch)")
  }
  
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
