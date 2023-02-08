/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 *
 * @author Monseigneur Philippe
 */
public class DataBaseController {
    
        public Connection _dbconnection = null;
    public Statement _statement = null;
    public ResultSet _resultSet = null;
    private String _url = "";
    private String _user = "";
    private String _psw = "";
    private Properties _property = null;
    
    /*  Getting and Setting */
    public String _getUrl(){
        return this._url;
    }
    public void _setUrl(String val){
        this._url = val;
    }
    
    public String _getUser(){
        return this._user;
    }
    public void _setUser(String val){
        this._user = val;
    }
    
    public String _getPsw(){
        return this._psw;
    }
    public void _setPsw(String val){
        this._psw = val;
    }
    
    public DataBaseController(String url, String user, String psw){
        this._url = url;
        this._user = user;
        this._psw = psw;
    }

        public Connection getConnection(){
        try{
            this._property = new Properties();
            this._property.put("user", "root");
            this._property.put("password", "");
            this._dbconnection = DriverManager.getConnection(this._url, this._property);
            
            System.out.println("Connexion réussie !");
        }
        catch(SQLException e){   
                 System.out.println(e);
        }
        return this._dbconnection;
    }
    
    public boolean db_InsertUpdate(String request){
        boolean returnValue = false;
        try{
            this._statement = this.getConnection().createStatement();
            this._statement.execute(request);
            returnValue = true;
        }
        catch(SQLException e){
            System.out.println(e);           
        }
        return returnValue;
    }
    
    public ResultSet db_select(String request){
        try{
            this._statement = this.getConnection().createStatement();
            this._resultSet = this._statement.executeQuery(request);
        }
        catch(SQLException e){
                        System.out.println(e);
        }
        return this._resultSet;
    }
    
}
