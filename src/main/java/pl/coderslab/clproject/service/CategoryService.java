package pl.coderslab.clproject.service;

import org.springframework.stereotype.Service;
import pl.coderslab.clproject.model.Category;
import pl.coderslab.clproject.repository.CategoryRepository;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    public Optional<Category> findByUserId(Long id) {
        return categoryRepository.findById(id);
    }

    public void save(Category category){
        categoryRepository.save(category);
    }

    public void delete(Long id){
        categoryRepository.deleteById(id);

    }
}