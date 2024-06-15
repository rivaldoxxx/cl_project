package pl.coderslab.clproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.clproject.model.Transaction;
import pl.coderslab.clproject.service.TransactionService;
import pl.coderslab.clproject.service.ExpenseService;

import java.util.List;

@Controller
@RequestMapping("/transactions")
public class TransactionController {

    private final TransactionService transactionService;
    private final ExpenseService expenseService;

    @Autowired
    public TransactionController(TransactionService transactionService, ExpenseService expenseService) {
        this.transactionService = transactionService;
        this.expenseService = expenseService;
    }

    @GetMapping("/selectUser")
    public String selectUser(Model model) {
        model.addAttribute("users", transactionService.findAll());
        return "selectUser";
    }

    @GetMapping("/list")
    public String listTransactions(Model model) {
        model.addAttribute("transactions", transactionService.findAll());
        model.addAttribute("expenses", expenseService.findAll());
        return "transactionsList";
    }

    @GetMapping("/new")
    public String showTransactionForm(Model model) {
        model.addAttribute("transaction", new Transaction());
        model.addAttribute("expenses", expenseService.findAll());
        return "transactionForm";
    }

    @PostMapping("/save")
    public String saveTransaction(@ModelAttribute Transaction transaction) {
        transactionService.save(transaction);
        return "redirect:/transactions/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteTransaction(@PathVariable Long id) {
        transactionService.delete(id);
        return "redirect:/transactions/list";
    }
}
