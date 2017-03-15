//
//  SegundoViewController.swift
//  UIKit Dinamico en iOS
//
//  Created by alumno on 3/14/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit

class SegundoViewController: UIViewController {
    
    var vwCabecera:UIView!
    var lblTitulo:UILabel!
    var segControl:UISegmentedControl!
    var btnAceptar:UIButton!
    var btnCancelar:UIButton!
    
    var colorUp:UIColor!

    var arregloVistas = Array<UIView>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorUp = UIColor(red: 255/255.0, green: 186/255.0, blue: 0/255.00, alpha: 1.0)

        
        vwCabecera = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        vwCabecera.backgroundColor = colorUp
        self.view.addSubview(vwCabecera)
        
        /*lblTitulo = UILabel(frame:
            
            CGRect(
                x: vwCabecera.frame.origin.x,
                y: vwCabecera.frame.origin.y,
                width: vwCabecera.frame.size.width,
                height: vwCabecera.frame.size.height)
        )*/
        
        lblTitulo = UILabel(frame: vwCabecera.frame)
        lblTitulo.text = "UIKit Dinamico en iOS"
        lblTitulo.textColor = UIColor.white
        lblTitulo.font = UIFont(name: "Helvetica-Bold", size: 17)
        lblTitulo.textAlignment = .center
        //self.view.addSubview(lblTitulo)
        vwCabecera.addSubview(lblTitulo)
        
        let margen:CGFloat = 10
        segControl = UISegmentedControl(frame: CGRect(x: margen, y: vwCabecera.frame.size.height + margen, width: self.view.frame.size.width - (margen*2) , height: 30))
        segControl.insertSegment(withTitle: "Primero", at: 0, animated: true)
        segControl.insertSegment(withTitle: "Segundo", at: 1, animated: true)
        segControl.tintColor = colorUp
        segControl.selectedSegmentIndex  = 0
        self.view.addSubview(segControl)
        
        btnAceptar = UIButton(frame: CGRect(x: margen, y: self.view.frame.size.height - margen - 30, width: 120, height: 30))
        
        btnAceptar.setTitle("Aceltar", for: UIControlState.normal)
        btnAceptar.backgroundColor = colorUp
        btnAceptar.addTarget(self, action: #selector(aceptar), for: UIControlEvents.touchUpInside)
        //btnAceptar.setTitleColor(colorUp, for: UIControlState.normal)
        self.view.addSubview(btnAceptar)
        
        
        btnCancelar = UIButton(frame: CGRect(x: self.view.frame.size.width - margen - 120 , y: btnAceptar.frame.origin.y  , width: 120, height: 30))
        
        btnCancelar.setTitle("Cancelar", for: UIControlState.normal)
        //btnCancelar.backgroundColor = colorUp
        btnCancelar.setTitleColor(colorUp, for: UIControlState.normal)
        btnCancelar.addTarget(self, action: #selector(cancelar), for: UIControlEvents.touchDown)
        self.view.addSubview(btnCancelar)
        
        // Do any additional setup after loading the view.
    }
    
    func aceptar(sender:UIButton){
        
        if(arregloVistas.count == 0){
            print("Le di click en aceptar")
            for i in 0...7{
                let vista = UIView(frame: CGRect(x: 100 + (Double(i) * 10.0), y: 100 + (Double(i) * 10.0), width: 100
                    , height: 100 ))
                vista.backgroundColor = colorUp
                self.view.addSubview(vista)
                
                arregloVistas.append(vista)
            }
        }
    }

    func cancelar(sender:UIButton){
        print("Le di click en elimiar")
        
        for vista in arregloVistas{
            vista.removeFromSuperview()
        }
        
        arregloVistas.removeAll();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

        let margen:CGFloat = 10
        
        vwCabecera.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60)

        lblTitulo.frame = vwCabecera.frame

        segControl.frame = CGRect(x: margen, y: vwCabecera.frame.size.height + margen, width: self.view.frame.size.width - (margen*2) , height: 30)

        btnAceptar.frame = CGRect(x: margen, y: self.view.frame.size.height - margen - 30, width: 120, height: 30)
        
        btnCancelar.frame = CGRect(x: self.view.frame.size.width - margen - 120 , y: btnAceptar.frame.origin.y  , width: 120, height: 30)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
