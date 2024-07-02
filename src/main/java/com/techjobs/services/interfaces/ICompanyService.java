package com.techjobs.services.interfaces;

import com.techjobs.dtos.CompanyDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.Company;
import com.techjobs.models.Company;

import java.util.List;

public interface ICompanyService {
    List<Company> getAll();
    Company getById(int id) throws DataNotFoundException;

    Company create(CompanyDTO companyDTO);
    Company update(CompanyDTO companyDTO,int id) throws DataNotFoundException;
    void delete(int id) throws DataNotFoundException;
}
