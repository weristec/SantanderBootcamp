package com.awrs.gerenciamentoPessoas.pessoas.repository;

import com.awrs.gerenciamentoPessoas.pessoas.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonRepository extends JpaRepository<Person, Long> {
}
