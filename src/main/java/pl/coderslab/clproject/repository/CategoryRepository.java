package pl.coderslab.clproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.clproject.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category,Long> {
}
