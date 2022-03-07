/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author firem
 */
public class Bill {
    private int id;
    private ArrayList<ServiceDetail> listService;
    private double price;

    public Bill() {
        listService = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ArrayList<ServiceDetail> getListService() {
        return listService;
    }

    public void setListService(ArrayList<ServiceDetail> listService) {
        this.listService = listService;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    public long getPriceLong(){
        return (long)price;
    }
}
