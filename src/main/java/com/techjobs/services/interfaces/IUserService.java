package com.techjobs.services.interfaces;

import com.techjobs.dtos.UserDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.Job;
import com.techjobs.models.User;
import com.techjobs.models.User;

import java.util.List;

public interface IUserService {
    List<User> getAll();
    User getById(int id) throws DataNotFoundException;

    User register(UserDTO userDTO) throws DataNotFoundException;
    User login(String username, String password);
    User update(UserDTO userDTO,int id) throws DataNotFoundException;
    void delete(int id) throws DataNotFoundException;
}
