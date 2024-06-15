package pl.coderslab.clproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.clproject.model.Expense;

import java.util.List;

public interface ExpenseRepository extends JpaRepository<Expense, Long> {
    List<Expense> findByUserId(Long userId);
}
