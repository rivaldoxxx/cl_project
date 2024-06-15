package pl.coderslab.clproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.clproject.model.Category;
import pl.coderslab.clproject.model.Users;
import pl.coderslab.clproject.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;


    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Users findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public Users findById(Long id) {
        Optional<Users> userOptional = userRepository.findById(id);
        return userOptional.orElse(null);
    }


    public void save(Users user) {
        userRepository.save(user);
    }
    public List<Users> findAll() {
        return userRepository.findAll();
    }
    public Optional<Users> findByUserId(Long id) {
        return userRepository.findById(id);
    }

    public void delete(Long id){
        userRepository.deleteById(id);
    }

}
