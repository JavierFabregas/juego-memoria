// pagina inicial

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadroImagen: UIImageView!
    @IBOutlet weak var numeroImagen: UILabel!
    var imagenes: [Int:UIImage] = [1:#imageLiteral(resourceName: "mario"),2:#imageLiteral(resourceName: "bowser"),3:#imageLiteral(resourceName: "greenMario"),4:#imageLiteral(resourceName: "bitch"),5:#imageLiteral(resourceName: "kingboo"),6:#imageLiteral(resourceName: "yoshi"),7:#imageLiteral(resourceName: "toad"),8:#imageLiteral(resourceName: "toadette"),9:#imageLiteral(resourceName: "Pikachu")]
    var posicionesAleatorias = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randArray()
        showImages()
    }
    
    func randArray (){
        var i = 0;
        for (_,_) in imagenes {
            posicionesAleatorias.append(i)
            i+=1
        }
        posicionesAleatorias.shuffle()
    }
    
    func showImages(){
        var i = 0
        
        
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block: { timer in
            if i < self.posicionesAleatorias.count{
                self.cadroImagen.image = self.imagenes[self.posicionesAleatorias[i]]
                self.numeroImagen.text = String(i+1)
            }
            i+=1
        })
        
       
        
    }
    
    
    
}

