//
//  ViewController.swift
//  DailyNews
//
//  Created by LUIS GONZALEZ on 17/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tablaNoticias: UITableView!
    
    
    var articuloNoticias : [Noticia] = []
    public typealias blkNoticiasResponse = (NoticiasModelo?, Error?) -> Void
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaNoticias.dataSource = self
        tablaNoticias.delegate = self
        
        buscarNoticias(withHandler: { respuesta, error in
            if error == nil {
                self.articuloNoticias = respuesta?.articles ?? []
                DispatchQueue.main.async {
                    self.tablaNoticias.reloadData()
                }
                
            }
        } )
    }
    
    func buscarNoticias(withHandler : @escaping blkNoticiasResponse) {
        let urlString = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=f0797ef3b62d4b90a400ed224e0f82b7&country=mx") ?? URL(fileURLWithPath: "")
        URLSession.shared.dataTask(with: urlString) { [self] data,response ,error in
            guard let datos = data else { return }
            do {
                let decoder = JSONDecoder()
                let respuesta = try decoder.decode(NoticiasModelo.self, from: datos)
                articuloNoticias = respuesta.articles
                tablaNoticias.reloadData()
                withHandler(respuesta, nil)
            } catch {
                withHandler(nil, error)
            }
        }
        
        
        /*
         // crear objeto de tipo url de manera segura
         if let url = URL(string: urlString) { // si se crea necesito un objeto de tipo dato (data)
         if let data = try? Data(contentsOf: url) { // decodifico de forma segura con un try  .... si se cre mi objeto de tipo data
         let decoder = JSONDecoder()   //creo un decodificador del tipio Json decoder para poder extraer la informacion
         // implemento try para evitar errores
         if let datosDecodificados = try? decoder.decode(NoticiasModelo.self, from: data) { //decodificara NoticiaModelo desde la constante data anteriormente creada .... si se crean mis datos decodificados
         articuloNoticias = datosDecodificados.articles  // si se crean mis datos puedo asiganrlos a mi arreglo vacio de datos decodificadosa
         tablaNoticias.reloadData()
         
         }
         }
         }
         */
        
        /*
         func getNoticias(withHandler: @escaping blkNoticiasResponse) {
         
         let urlStr = URL"https://newsapi.org/v2/top-headlines?apiKey=f0797ef3b62d4b90a400ed224e0f82b7&country=mx" ?? URL(fileURLWithPath: "")
         
         URLSession.shared.dataTask(with: urlStr) { data, response, error in
         guard let datos = data else { return }
         do {
         let decoder = JSONDecoder()
         let respuesta = try decoder.decode(NoticiasModelo.self, from: datos)
         withHandler(respuesta, nil)
         } catch {
         withHandler(nil,error)
         }
         }.resume()  */
    }
}




extension ViewController : UITableViewDelegate & UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articuloNoticias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablaNoticias.dequeueReusableCell(withIdentifier: "celdaNoticia", for: indexPath)
        cell.textLabel?.text = "Articulo 1 "
        return cell
    }
    
    
}
