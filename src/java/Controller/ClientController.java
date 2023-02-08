/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Model.Client;
import Interface.Connectivity;
import java.math.BigInteger;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;


/**
 *
 * @author Monseigneur Philippe
 */
public class ClientController extends Client implements Connectivity {
 private DataBaseController _db = null;
 
    public ClientController(){
       this._db = new DataBaseController(URL, USER, PASSWORD);
    }
 
        public Object[][] getClients()
    {
        
        String req = "SELECT A.ID_COMPTE, B.nom, B.prenom FROM compte AS A LEFT JOIN client AS B ON A.id_client = B.id_client";
        this._db.db_select(req);
        
                int ligne = 0;
       
        Object tab[][] = new Object[10][100];    
        try{
            while(this._db._resultSet.next()){
                
                tab[ligne][0] = this._db._resultSet.getString("ID_COMPTE");
                tab[ligne][1] = this._db._resultSet.getString("nom");
                tab[ligne][2] = this._db._resultSet.getString("prenom");
                
                System.out.print(this._db._resultSet.getString("ID_COMPTE") + " " + this._db._resultSet.getString("nom"));
                ligne++;
            }
        }
        catch(SQLException e){
            System.out.print(e);
        }
        
        return tab;

    }
}
