// pagina inicial

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadroImagen: UIImageView!
    @IBOutlet weak var numeroImagen: UILabel!
    
    @IBOutlet weak var jugar: UIButton!
    
    var imagenes: [Int:UIImage] = [0:#imageLiteral(resourceName: "mario"),1:#imageLiteral(resourceName: "bowser"),2:#imageLiteral(resourceName: "greenMario"),3:#imageLiteral(resourceName: "bitch"),4:#imageLiteral(resourceName: "kingboo"),5:#imageLiteral(resourceName: "yoshi"),6:#imageLiteral(resourceName: "toad"),7:#imageLiteral(resourceName: "toadette"),8:#imageLiteral(resourceName: "pikachu-1")]
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
            if i == self.imagenes.count {
                self.jugar.isHidden = false
            }
        })
        
        
        
       
        
    }
    
    
    
}

