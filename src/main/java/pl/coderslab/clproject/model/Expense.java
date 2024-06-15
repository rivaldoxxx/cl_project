package pl.coderslab.clproject.model;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.time.LocalDate;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Expense {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_expense")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    @NotNull(message = "User is required")
    private Users user;

    @ManyToOne
    @JoinColumn(name = "category_id", nullable = false)
    @NotNull(message = "Category is required")
    private Category category;


    @Column(nullable = false)
    @Min(value = 0, message = "Amount must be greater than or equal to 0")
    private BigDecimal amount;

    @Column(nullable = false)
    @NotNull(message = "Date is required")
    private LocalDate date;

    @Size(max = 255, message = "Description must be less than 255 characters")
    private String description;

    // Getters and setters
}
