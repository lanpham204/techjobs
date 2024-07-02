package com.techjobs.services;


import com.itextpdf.forms.PdfAcroForm;
import com.itextpdf.forms.fields.PdfFormField;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import org.springframework.stereotype.Service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

@Service
public class PDFService {

//    public void generateCV(CV cv, String templatePath, String outputPath) throws IOException {
//        PdfDocument pdfDoc = new PdfDocument(new PdfReader(templatePath), new PdfWriter(new FileOutputStream(outputPath)));
//        PdfAcroForm form = PdfAcroForm.getAcroForm(pdfDoc, true);
//        Map<String, PdfFormField> fields = form.getFormFields();
//
//        fields.get("name").setValue(cv.getName());
//        fields.get("email").setValue(cv.getEmail());
//        fields.get("phoneNumber").setValue(cv.getPhoneNumber());
//        fields.get("address").setValue(cv.getAddress());
//        fields.get("education").setValue(cv.getEducation());
//        fields.get("experience").setValue(cv.getExperience());
//        fields.get("skills").setValue(cv.getSkills());
//
//        form.flattenFields();
//        pdfDoc.close();
//    }
}

