/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.ejb.Stateless;
import javax.ejb.LocalBean;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;

import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

/**
 *
 * @author Osvaldo
 */
@Stateless
@LocalBean
public class BuildPdf {

    public BuildPdf() {
    }

    public void build(String path, Client client, ShopingCar shopingCar) {
        try {
            OutputStream file = new FileOutputStream(new File("C:\\Users\\Osvaldo\\Documents\\NetBeansProjects\\TiendaAs\\TiendaAs-war\\resorce\\purchase.pdf"));
            Document document = new Document();
            PdfWriter.getInstance(document, file);
            document.open();
            document.add(new Paragraph("Receipe"));
            document.addTitle(client.getName());
            document.addHeader("Name", "Purchase");
            document.addSubject("subject");
            document.add(new Paragraph("---------------------------------------------------------------"));
            document.add(new Paragraph("Name:" + client.getName()));
            document.add(new Paragraph("Purchase"));
            for (Product product : shopingCar.getListProduct()) {
                document.add(new Paragraph("Name of product:" + product.getDescription()));
                document.add(new Paragraph("Price:" + product.getPurchaseCost()));
            }

            document.close();
            file.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
