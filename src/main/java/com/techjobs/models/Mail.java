package com.techjobs.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Mail {
    String from = "FPT Polytechnic <poly@gmail.com>";
    String to;
    String subject;
    String body;
    List<String> cc = new ArrayList();
    List<String> bcc = new ArrayList<>();
    List<File> files = new ArrayList<>();
    public Mail(String to, String subject, String body) {
        super();
        this.to = to;
        this.subject = subject;
        this.body = body;
    }
}
