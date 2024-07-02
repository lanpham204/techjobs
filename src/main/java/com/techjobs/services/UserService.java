package com.techjobs.services;

import com.techjobs.dtos.CompanyDTO;
import com.techjobs.dtos.UserDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.Company;
import com.techjobs.models.Role;
import com.techjobs.models.User;
import com.techjobs.repositories.RoleRepository;
import com.techjobs.repositories.UserRepository;
import com.techjobs.services.interfaces.IUserService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class UserService implements IUserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ModelMapper modelMapper;
    @Override
    public List<User> getAll() {
        return userRepository.findAll();
    }

    @Override
    public User getById(int id) throws DataNotFoundException {
        return userRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Cannot found user with id: " + id));
    }

    @Override
    public User register(UserDTO userDTO) throws DataNotFoundException {
        Role role = roleRepository.findById(userDTO.getRoleId())
                .orElseThrow(() -> new DataNotFoundException("Cannot found role with id: " + userDTO.getRoleId()));
        modelMapper.typeMap(UserDTO.class, User.class).addMappings(mp -> mp.skip(User::setId));
        User user = modelMapper.map(userDTO, User.class);
        user.setRole(role);
        return userRepository.save(user);
    }

    @Override
    public User login(String username, String password) {
        return userRepository.findByEmail(username);
    }

    @Override
    public User update(UserDTO userDTO, int id) throws DataNotFoundException {
        Role role = roleRepository.findById(userDTO.getRoleId())
                .orElseThrow(() -> new DataNotFoundException("Cannot found role with id: " + userDTO.getRoleId()));
        User user = getById(id);
        modelMapper.typeMap(UserDTO.class, User.class).addMappings(mp -> mp.skip(User::setId));
        modelMapper.map(userDTO,user);
        user.setRole(role);
        return userRepository.save(user);
    }

    @Override
    public void delete(int id) throws DataNotFoundException {
        User user = getById(id);
        userRepository.delete(user);
    }
}
