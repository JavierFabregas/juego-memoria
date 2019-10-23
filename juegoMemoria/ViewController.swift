// pagina inicial

import UIKit
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
    
    func randArray (){
        var i = 0;
        for (_) in imagenes {
            posicionesAleatorias.append(i)
            i+=1
        }
        posicionesAleatorias.shuffle()
    }
    
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
