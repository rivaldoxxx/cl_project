package pl.coderslab.clproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.clproject.model.Budget;
import pl.coderslab.clproject.service.BudgetService;
import pl.coderslab.clproject.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/budgets")
public class BudgetController {

    private final BudgetService budgetService;
    private final UserService userService;

    @Autowired
    public BudgetController(BudgetService budgetService, UserService userService) {
        this.budgetService = budgetService;
        this.userService = userService;
    }

    @GetMapping("/list")
    public String listBudgets(@RequestParam(required = false) Long userId, Model model) {
        if (userId != null) {
            List<Budget> budgets = budgetService.findByUserId(userId);
            model.addAttribute("budgets", budgets);
        } else {
            model.addAttribute("budgets", budgetService.findAll());
        }
        return "budgetsList";
    }

    @GetMapping("/new")
    public String showBudgetForm(@RequestParam Long userId, Model model) {
        model.addAttribute("budget", new Budget());
        model.addAttribute("userId", userId);
        return "budgetForm";
    }

    @PostMapping("/save")
    public String saveBudget(@ModelAttribute Budget budget, @RequestParam Long userId) {
        budget.setUser(userService.findById(userId));
        budgetService.save(budget);
        return "redirect:/budgets/list?userId=" + userId;
    }

    @GetMapping("/delete/{id}")
    public String deleteBudget(@PathVariable Long id, @RequestParam Long userId) {
        budgetService.delete(id);
        return "redirect:/budgets/list?userId=" + userId;
    }
}
