/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Model.CompteModel;
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
public class CompteController extends CompteModel implements Connectivity {
    private DataBaseController _db = null;
    
    public CompteController(){
       this._db = new DataBaseController(URL, USER, PASSWORD);
    }
    
    public static String getMd5Hash(String input)
    {
        String hashText = "";
        
        try{
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
        
            hashText = no.toString(16);
            while(hashText.length() < 32)
            {
                hashText = "0" + hashText;
            }
        }
        catch(NoSuchAlgorithmException e)
        {
            
        }
        return hashText;
    }
    
    private boolean updateSolde(float amount)
    {
        boolean done; 

        try{
            String req = "UPDATE compte SET solde = solde + '"  + amount + "'" + " WHERE ID_COMPTE = '"  + CompteModel.idCompte + "'";
                    
            done = this._db.db_InsertUpdate(req);
        }
        catch(Exception ex){
            System.out.println(ex);
            done = false;
        }
        return done;        
    }
    
        private boolean updateSolde(float amount, String beneficiare)
    {
        boolean done; 

        try{
            String req = "UPDATE compte SET solde = solde + '"  + amount + "'" + " WHERE ID_COMPTE = '"  + beneficiare + "'";
                    
            done = this._db.db_InsertUpdate(req);
        }
        catch(Exception ex){
            System.out.println(ex);
            done = false;
        }
        return done;        
    }
        
    
        private boolean reduceSolde(float amount)
    {
        boolean done; 

        try{
            String req = "UPDATE compte SET solde = solde - '"  + amount + "'" + " WHERE ID_COMPTE = '"  + CompteModel.idCompte + "'";
                    
            done = this._db.db_InsertUpdate(req);
        }
        catch(Exception ex){
            System.out.println(ex);
            done = false;
        }
        return done;        
    }
        
    public boolean makeDepot(float amount, int compteId)
    {
        boolean done; 
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy à HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String currentDate = dateFormatter.format(now);
        
        try{
            String req = "INSERT INTO depot(montant, cpteDebit, dateDepot) "
                         + "VALUES('"  + amount + "', '" + compteId +  "', '" + currentDate + "')";
                    
            done = this._db.db_InsertUpdate(req);
            this.updateSolde(amount);
        }
        catch(Exception ex){
            System.out.println(ex);
            done = false;
        }
        return done;
    }
    
       public boolean makeTransfert(float amount, String beneficiaire)
    {
        boolean done; 
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy à HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String currentDate = dateFormatter.format(now);
        
        try{
            String req = "INSERT INTO transfert(montantTrans, cpteExp, cpteBen, dateTransfert) "
                         + "VALUES('"  + amount + "', '" + CompteModel.idCompte +  "', '" + beneficiaire + "', '" + currentDate + "')";
                    
            done = this._db.db_InsertUpdate(req);
            this.reduceSolde(amount);
            this.updateSolde(amount, beneficiaire);
        }
        catch(Exception ex){
            System.out.println(ex);
            done = false;
        }
        return done;
    }
        
    public boolean register(String lastname, String firstname, String sex, String phone, String birthdate, String nationality, String job, String civilState)
    {
        boolean done; 

        try{
            String req = "INSERT INTO client(nom, prenom, sexe, telephone, dateNaissance, nationalite, profession, etatCivil) "
                         + "VALUES('" + lastname + "', '" + firstname + "', '" + sex + "', '" + phone + "', '" + birthdate + "', '" + nationality + "', '" + job + "', '" + civilState + "')";
                    
            done = this._db.db_InsertUpdate(req);
            
        }
        catch(Exception ex){
            System.out.println(ex);
            done = false;
        }
        
        return done;
    }
    
    public boolean login(String psw, String idCard){
        
        String req = "SELECT ID_COMPTE, id_agent, id_client, type, solde, IDcard, psw FROM compte "
                                + "WHERE psw = '" + psw + "' AND IDcard = '" + idCard + "' ";
        this._db.db_select(req);
        
        
        int ligne = 0;
        boolean found = false; 
            
        try{
            while(this._db._resultSet.next()){
                
                if(psw.compareTo(this._db._resultSet.getString("psw")) == 0){
                    found = true;
                   
                    CompteModel.idClient = this._db._resultSet.getInt(("id_client"));
                    CompteModel.idCompte = this._db._resultSet.getInt(("ID_COMPTE"));
                    CompteModel.idCard = this._db._resultSet.getString("IDcard");
                    break;
                }
                ligne++;
            }
        }
        catch(SQLException e){
            System.out.println(e);
        }
         
        return found;

    }
    
        public boolean completeRegistration(String psw, String accounType){
        
            boolean done; 

            String lastUser = this.findLastUser();
            String randCode = "RAW-" + CompteController.getMd5Hash(psw).toUpperCase().substring(0, 6);                                                  
            
            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy à HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String currentDate = dateFormatter.format(now);

        try{
            String req = "INSERT INTO compte(id_client, type, dateCreation, IDcard, psw) "
                         + "VALUES('" + lastUser + "', '" + accounType + "', '"  + currentDate + "', '"  + randCode + "', '"  + psw + "')";
            done = this._db.db_InsertUpdate(req);
            
            this.login(psw, randCode);
        }
        catch(Exception ex){
            System.out.println(ex);
            done = false;
        }
        
        return done;
    }

        
    public String findLastUser(){

        String req = "SELECT id_client FROM client ORDER BY id_client DESC LIMIT 1";
        this._db.db_select(req);
        
        
        int ligne = 0;
        String userId = "";
            
        try{
            while(this._db._resultSet.next()){
                
                userId = this._db._resultSet.getString("id_client");
                //this.idClient =  this._db._resultSet.getString("id_client");
                System.out.println("Last User : " + userId);
                ligne++;
            }
        }
        catch(SQLException e){
            System.out.println(e);
        }
         
        return userId;
    }
    
    public Object[][] getDepots(int counter)
    {
        
        String req = "SELECT montant, dateDepot FROM depot WHERE cpteDebit = " + CompteModel.idCompte + " ORDER BY id_depot DESC LIMIT " + counter;
        this._db.db_select(req);
        
        
                int ligne = 0;
       
        Object tab[][] = new Object[10][100];    
        try{
            while(this._db._resultSet.next()){
                tab[ligne][0] = this._db._resultSet.getString("montant");
                tab[ligne][1] = this._db._resultSet.getString("dateDepot");
                            System.out.print(this._db._resultSet.getString("montant"));
                ligne++;
            }
        }
        catch(SQLException e){
            System.out.print(e);
        }
        
        return tab;

    }
    
      public Object[][] getTransfers(int counter)
    {
        
        String req = "SELECT A.montantTrans, A.dateTransfert, C.nom, C.prenom FROM transfert AS A LEFT JOIN compte AS B ON A.cpteBen = B.ID_COMPTE LEFT JOIN client AS C ON B.id_client  = C.id_client"
                + " WHERE A.cpteExp = " + CompteModel.idCompte + " ORDER BY id_transfert DESC LIMIT " + counter;
        this._db.db_select(req);
        
        
                int ligne = 0;
       
        Object tab[][] = new Object[10][100];    
        try{
            while(this._db._resultSet.next()){
                tab[ligne][0] = this._db._resultSet.getString("montantTrans");
                tab[ligne][1] = this._db._resultSet.getString("dateTransfert");
                tab[ligne][2] = this._db._resultSet.getString("prenom");
                tab[ligne][3] = this._db._resultSet.getString("prenom");
                
                System.out.print(this._db._resultSet.getString("dateTransfert"));
                ligne++;
            }
        }
        catch(SQLException e){
            System.out.print(e);
        }
        
        return tab;

    }
        
        public  String getAccountSolde()
    {
        String req = "SELECT solde FROM compte WHERE ID_COMPTE = " + CompteModel.idCompte;
        this._db.db_select(req);
        
        int ligne = 0;
       
        String solde = "";    
        try{
            while(this._db._resultSet.next()){
                solde = this._db._resultSet.getString("solde");
                System.out.print("Mon solde : " + solde);
                ligne++;
            }
        }
        catch(SQLException e){
            System.out.print(e);
        }
        
        return solde;
    }
}
