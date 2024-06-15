package pl.coderslab.clproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.clproject.model.Expense;
import pl.coderslab.clproject.service.CategoryService;
import pl.coderslab.clproject.service.ExpenseService;
import pl.coderslab.clproject.service.UserService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/expenses")
public class ExpenseController {

    private final ExpenseService expenseService;
    private final UserService userService;
    private final CategoryService categoryService;

    @Autowired
    public ExpenseController(ExpenseService expenseService, UserService userService, CategoryService categoryService) {
        this.expenseService = expenseService;
        this.userService = userService;
        this.categoryService = categoryService;
    }

    @GetMapping("/selectUser")
    public String selectUser(Model model) {
        model.addAttribute("users", userService.findAll());
        return "selectUser";
    }

    @GetMapping("/list")
    public String listExpenses(@RequestParam(required = false) Long userId, Model model) {
        if (userId != null) {
            List<Expense> expenses = expenseService.findByUserId(userId);
            model.addAttribute("expenses", expenses);
        } else {
            model.addAttribute("expenses", new ArrayList<>());
        }
        return "expensesList";
    }

    @GetMapping("/new")
    public String showExpenseForm(@RequestParam Long userId, Model model) {
        model.addAttribute("expense", new Expense());
        model.addAttribute("userId", userId);
        model.addAttribute("categories", categoryService.findAll());
        return "expenseForm";
    }

    @PostMapping("/save")
    public String saveExpense(@ModelAttribute Expense expense, @RequestParam Long userId) {
        expense.setUser(userService.findById(userId));
        expenseService.save(expense);
        return "redirect:/expenses/list?userId=" + userId;
    }

    @GetMapping("/delete/{id}")
    public String deleteExpense(@PathVariable Long id, @RequestParam Long userId) {
        expenseService.delete(id);
        return "redirect:/expenses/list?userId=" + userId;
    }
}
