package pl.coderslab.clproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.clproject.model.Users;

public interface UserRepository extends JpaRepository<Users, Long> {
    Users findByUsername(String username);
}
