//
//  Home.swift
//  GameStreamAppiOs
//
//  Created by Tech Fitco on 15/06/22.
//

import SwiftUI
import AVKit

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
      
      ScreenHome()
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

struct ScreenHome:View{
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
        
        ScrollView(showsIndicators: false) {
          submoduleHome()
        }
        
      }.padding(.horizontal,18)
      
    }.navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
    
  }
  
  func searchVideo(){
    print("Searching video...\(textSearch)")
  }
  
}

struct submoduleHome:View{
  
  @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
  @State var isPlayerActive = false
  let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
  
  var body: some View{
    
    VStack{
      Text("LOS MÁS POPULARES")
        .font(.title3)
        .foregroundColor(Color("White"))
        .bold()
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .padding(.top)
      
      ZStack{
        
        Button {
          url = urlVideos[0]
          print("URL: \(url)")
          isPlayerActive = true
        } label: {
          
          VStack(spacing: 0){
            Image("the_witcher")
              .resizable()
              .scaledToFill()
            Text("The Witcher 3")
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
              .background(Color("ButtonNetworksColor"))
            
          }
          
        }
        
        Image(systemName: "play.circle.fill")
          .resizable()
          .frame(width: 42, height: 42)
          .foregroundColor(Color("White"))

        
        
      }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        .padding(.vertical)
      
    }
    
    NavigationLink(
      destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!))
        .frame(width: 400, height: 300),
      isActive: $isPlayerActive,
      label:{
        EmptyView()
      })
    
  }
  
  
  
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}
