//pagina juego

import UIKit

class gameViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
        @IBOutlet weak var collectionImages: UICollectionView!
        @IBOutlet weak var texto: UILabel!
        var intentos = 0
        @IBOutlet weak var mensajeFinal: UILabel!
        @IBOutlet weak var volverAJugar: UIButton!
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagenes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cel = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! ImageCell
        cel.ImageInCell.image = imagenes[indexPath.row]
        return cel
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //accion al clicar una celda
        let celda = collectionView.cellForItem(at: indexPath)
        
        if posicionesAleatorias.count != 0{
            if posicionesAleatorias[0] == indexPath.row {
                posicionesAleatorias.remove(at: 0)
                celda?.isHidden = true
                print("posiciones aleatorias -> " + String(posicionesAleatorias.count))
            }else{
                intentos+=1
                texto.text = String(intentos)
                print("intentos -> " + String(intentos))
            }
        }
        
        isEndgame()
        
    }
    
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
