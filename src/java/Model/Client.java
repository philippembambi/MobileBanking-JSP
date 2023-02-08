/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Monseigneur Philippe
 */
public class Client {

    /**
     * @return the idClient
     */
    public int getIdClient() {
        return idClient;
    }

    /**
     * @param idClient the idClient to set
     */
    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    /**
     * @return the nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * @param nom the nom to set
     */
    public void setNom(String nom) {
        this.nom = nom;
    }

    /**
     * @return the prenom
     */
    public String getPrenom() {
        return prenom;
    }

    /**
     * @param prenom the prenom to set
     */
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    /**
     * @return the sexe
     */
    public String getSexe() {
        return sexe;
    }

    /**
     * @param sexe the sexe to set
     */
    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    /**
     * @return the adresse
     */
    public String getAdresse() {
        return adresse;
    }

    /**
     * @param adresse the adresse to set
     */
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    /**
     * @return the tel
     */
    public String getTel() {
        return tel;
    }

    /**
     * @param tel the tel to set
     */
    public void setTel(String tel) {
        this.tel = tel;
    }

    /**
     * @return the dateNaissance
     */
    public String getDateNaissance() {
        return dateNaissance;
    }

    /**
     * @param dateNaissance the dateNaissance to set
     */
    public void setDateNaissance(String dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    /**
     * @return the nationalite
     */
    public String getNationalite() {
        return nationalite;
    }

    /**
     * @param nationalite the nationalite to set
     */
    public void setNationalite(String nationalite) {
        this.nationalite = nationalite;
    }

    /**
     * @return the profession
     */
    public String getProfession() {
        return profession;
    }

    /**
     * @param profession the profession to set
     */
    public void setProfession(String profession) {
        this.profession = profession;
    }

    /**
     * @return the etatCivil
     */
    public String getEtatCivil() {
        return etatCivil;
    }

    /**
     * @param etatCivil the etatCivil to set
     */
    public void setEtatCivil(String etatCivil) {
        this.etatCivil = etatCivil;
    }

    private int idClient;
    private String nom;
    private String prenom;
    private String sexe;
    private String adresse;
    private String tel;
    private String dateNaissance;
    private String nationalite;
    private String profession;
    private String etatCivil;

    
}
