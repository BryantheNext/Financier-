//
//  CalculatorScreen.swift
//  Billionare Mind
//
//  Created by Leos, Bryan - Student on 4/17/24.
//

import SwiftUI



struct CalculatorScreen:View{
    var body: some View{
        VStack{
           Text("Hi")
        }
    }
}

#Preview {
    CalculatorScreen()
}

/*
 class BaseCurrency: Codable {
 let id = UUID()
 var baseCurrencies: [String : [String: Double]] = [:]
 required public init(from decoder: Decoder) throws {
 do{
 print(#function)
 let baseContainer = try decoder.singleValueContainer()
 let base = try baseContainer.decode([String : [String: Double]].self)
 for key in base.keys{
 baseCurrencies[key] = base[key]
 }
 }catch{
 print(error)
 throw error
 }
 }
 //@State should never be used outside a struct that is a View
 }
 struct CurrencyView: View {
 @StateObject var vm: CurrencyViewModel = CurrencyViewModel()
 
 var body: some View {
 VStack{
 List{
 if vm.results != nil{
 ForEach(vm.results!.baseCurrencies.sorted{$0.key < $1.key}, id: \.key) { key, baseCurrency in
 DisclosureGroup(key){
 ForEach(baseCurrency.sorted{$0.key < $1.key}, id: \.key) { key, rate in
 HStack{
 Text(key)
 Text(rate.description)
 }
 }
 }
 }
 }else{
 Text("waiting...")
 }
 }
 //To select another rate to go fetch
 RatesPickerView().environmentObject(vm)
 }.onAppear(){
 vm.UpdateRates()
 }
 }
 }
 struct RatesPickerView: View {
 @EnvironmentObject var vm: CurrencyViewModel
 var body: some View {
 if vm.results != nil{
 //You can probaly populate this picker with the keys in
 // baseCurrency.baseCur.baseS
 Picker("rates", selection: $vm.selectedBaseCurrency){
 ForEach((vm.results!.baseCurrencies.first?.value.sorted{$0.key < $1.key})!, id: \.key) { key, rate in
 Text(key).tag(key)
 }
 }
 }else{
 Text("waiting...")
 }
 }
 }
 class CurrencyViewModel: ObservableObject{
 
 @Published var results: BaseCurrency?
 @Published var selectedBaseCurrency: String = "usd"{
 didSet{
 UpdateRates()
 }
 }
 init() {
 //If you can .onAppear you don't need it here
 //UpdateRates()
 }
 func UpdateRates() {
 print(#function)
 let baseUrl = "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/"
 let baseCur = selectedBaseCurrency   // usd
 let requestType = ".json"
 
 guard let url = URL(string: baseUrl + baseCur + requestType) else {
 print("Invalid URL")
 return
 }
 let request = URLRequest(url: url)
 URLSession.shared.dataTask(with: request) { data, response, error in
 if let data = data {
 do{
 let decodedResponse = try JSONDecoder().decode(BaseCurrency.self, from: data)
 
 DispatchQueue.main.async {
 
 if self.results == nil{
 //Assign a new base currency
 self.results = decodedResponse
 }else{ //merge the existing with the new result
 for base in decodedResponse.baseCurrencies.keys{
 self.results?.baseCurrencies[base] = decodedResponse.baseCurrencies[base]
 }
 }
 //update the UI
 self.objectWillChange.send()
 }
 
 }catch{
 //Error thrown by a try
 print(error)//much more informative than error?.localizedDescription
 }
 }
 if error != nil{
 //data task error
 print(error!)
 }
 }.resume()
 }
 }
 */
