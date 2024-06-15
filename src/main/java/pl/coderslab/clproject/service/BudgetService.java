package pl.coderslab.clproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.clproject.model.Budget;
import pl.coderslab.clproject.repository.BudgetRepository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class BudgetService {
    private final BudgetRepository budgetRepository;

    @Autowired
    public BudgetService(BudgetRepository budgetRepository) {
        this.budgetRepository = budgetRepository;
    }

    public List<Budget> findAll() {
        return budgetRepository.findAll();
    }

    public List<Budget> findByUserId(Long userId) {
        return budgetRepository.findByUserId(userId);
    }

    public Budget findById(Long id) {
        return budgetRepository.findById(id).orElse(null);
    }

    public void save(Budget budget) {
        budgetRepository.save(budget);
    }

    public void delete(Long id) {
        budgetRepository.deleteById(id);
    }
    public List<Budget> findActiveBudgets(Long userId, LocalDate date) {
        return budgetRepository.findByUserIdAndStartDateLessThanEqualAndEndDateGreaterThanEqual(userId, date, date);
    }
    public Budget findActiveBudget(Long userId, LocalDate date) {
        List<Budget> budgets = findActiveBudgets(userId, date);
        return budgets.isEmpty() ? null : budgets.get(0);
    }
}
