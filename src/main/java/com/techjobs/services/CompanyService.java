package com.techjobs.services;

import com.techjobs.dtos.CompanyDTO;
import com.techjobs.dtos.JobDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.Company;
import com.techjobs.models.Job;
import com.techjobs.repositories.CompanyRepository;
import com.techjobs.services.interfaces.ICompanyService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class CompanyService implements ICompanyService {
    private final CompanyRepository companyRepository;
    private final ModelMapper modelMapper;
    @Override
    public List<Company> getAll() {
        return companyRepository.findAll();
    }

    @Override
    public Company getById(int id) throws DataNotFoundException {
        return companyRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Cannot found company with id: " + id));
    }

    @Override
    public Company create(CompanyDTO companyDTO) {
        modelMapper.typeMap(CompanyDTO.class, Company.class).addMappings(mp -> mp.skip(Company::setId));
        Company company = modelMapper.map(companyDTO, Company.class);
        return companyRepository.save(company);
    }

    @Override
    public Company update(CompanyDTO companyDTO, int id) throws DataNotFoundException {
        Company company = getById(id);
        modelMapper.typeMap(CompanyDTO.class, Company.class).addMappings(mp -> mp.skip(Company::setId));
        modelMapper.map(companyDTO,company);
        return companyRepository.save(company);
    }

    @Override
    public void delete(int id) throws DataNotFoundException {
        Company company = getById(id);;
        companyRepository.delete(company);
    }
}
