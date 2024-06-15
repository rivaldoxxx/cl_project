package pl.coderslab.clproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.clproject.model.Transaction;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {
}
