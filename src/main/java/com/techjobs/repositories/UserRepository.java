package com.techjobs.repositories;

import com.techjobs.models.Role;
import com.techjobs.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {
    User findByEmail(String email);
}
