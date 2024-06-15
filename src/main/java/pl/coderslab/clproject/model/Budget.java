package pl.coderslab.clproject.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
public class Budget {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_budget")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users user;

    @DecimalMin("0.01")
    @NotNull
    private BigDecimal amount;

    @NotNull
    private LocalDate startDate;

    @NotNull
    private LocalDate endDate;
}
