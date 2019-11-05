//pagina juego

import UIKit

class gameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
        @IBOutlet weak var collectionImages: UICollectionView!
        @IBOutlet weak var texto: UILabel!
        var intentos = 0
        @IBOutlet weak var mensajeFinal: UILabel!
        @IBOutlet weak var volverAJugar: UIButton!
    
    
    // definir el numero de celdas que va a tener el collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagenes.count
    }
    // Mostrar las imagenes del array de imagenes en orden
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! ImageCell
        cel.ImageInCell.image = imagenes[indexPath.row]
        return cel
    }
    
    //accion al clicar una celda
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //accion al clicar una celda
        let celda = collectionView.cellForItem(at: indexPath)  as! ImageCell
        //comprobar si la posicion de la celda clicada es la misma que la primera posicion del array desordenado.
        if posicionesAleatorias.count != 0{
            if posicionesAleatorias[0] == indexPath.row {
                
                celda.ImageInCell.alpha = 1;
                UIView.animate(withDuration: 0.5, animations: {
                    celda.ImageInCell.alpha = 0;
                }) { (ok) in
                     celda.isHidden = true
                }
                
                posicionesAleatorias.remove(at: 0)
               
                print("posiciones aleatorias -> " + String(posicionesAleatorias.count))
            }else{
                intentos+=1
                texto.text = String(intentos)
                print("intentos -> " + String(intentos))
            }
        }
        
        isEndgame()
        
    }
    // comprobacion si el juego ha acabado y mostrar el mensaje final del juego con el boton de volver a jugar
    func isEndgame (){
        if posicionesAleatorias.count == 0 {
            mensajeFinal.isHidden = false
            volverAJugar.isHidden = false
            if intentos>10{
                mensajeFinal.text = "Has tenido " + String(intentos) + " errores. Puedes hacerlo mejor"
            }else{
                mensajeFinal.text = "Muy bien!! lo has conseguido con " + String (intentos) + " intentos ¿podrás superarlo?"
            }
        }
        
    }
    
    func mostrar_aleatorios() {
        var tex = ""
        for i in 0 ... posicionesAleatorias.count - 1 {
            tex = tex + String(posicionesAleatorias[i]) + " "
        }
        texto.text = tex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionImages.dataSource = self
        collectionImages.delegate = self
        //mostrar_aleatorios()
    }
    
    
}
