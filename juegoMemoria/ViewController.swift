// pagina inicial

import UIKit

// Creamos 2 arrays globales con los que jugaremos posteriormente, uno con todas las imagenes del juego y otro con las posiciones aleatorias que se van a mostrar, esto nos servira para en la pantalla de juego mostrar las imagenes y para comparar el orden en el que el jugador selecciona las imagenes.
var imagenes: [UIImage] = [#imageLiteral(resourceName: "mario"),#imageLiteral(resourceName: "bowser"),#imageLiteral(resourceName: "greenMario"),#imageLiteral(resourceName: "bitch"),#imageLiteral(resourceName: "kingboo"),#imageLiteral(resourceName: "yoshi"),#imageLiteral(resourceName: "toad"),#imageLiteral(resourceName: "toadette"),#imageLiteral(resourceName: "pikachu-1")]
var posicionesAleatorias = [Int]()

class ViewController: UIViewController {

    @IBOutlet weak var cadroImagen: UIImageView!
    @IBOutlet weak var numeroImagen: UILabel!
    
    @IBOutlet weak var jugar: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randArray()
        showImages()
    }
    
    //Metodo con el que creamos un array de tantos numeros como imagenes tenga el juego, desordena las posiciones de este array y lo devuelve
    func randArray (){
        var i = 0;
        for (_) in imagenes {
            posicionesAleatorias.append(i)
            i+=1
        }
        posicionesAleatorias.shuffle()
    }
    //Metodo con el que mostrar las imagenes del array de imagenes en el orden aleatorio generado en el metodo randArray()
    func showImages(){
        var i = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block: { timer in
            if i < posicionesAleatorias.count{
                self.cadroImagen.image = imagenes[posicionesAleatorias[i]]
                self.numeroImagen.text = String(i+1)
            }
            i+=1
            if i == imagenes.count {
                self.jugar.isHidden = false
            }
        })
        
    }
}
