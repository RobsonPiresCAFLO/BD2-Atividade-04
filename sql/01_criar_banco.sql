-- =====================================================================
-- IFPI Campus Floriano · TADS – Módulo III · Banco de Dados II
-- Atividade-04 – Stored Procedures e Triggers
--
-- 01_criar_banco.sql – cria o banco DBatividade4 com as tabelas e os
-- dados iniciais. Rode este arquivo inteiro UMA vez, no começo.
-- ATENÇÃO: se o banco DBatividade4 já existir, ele é apagado e recriado.
-- =====================================================================

DROP DATABASE IF EXISTS DBatividade4;
CREATE DATABASE DBatividade4 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE DBatividade4;

-- ---------------------------------------------------------------------
-- Tabelas
-- ---------------------------------------------------------------------
CREATE TABLE contas (
  id_conta INT PRIMARY KEY AUTO_INCREMENT,
  titular  VARCHAR(50)            NOT NULL,
  saldo    DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0,
  status   VARCHAR(10)            NOT NULL DEFAULT 'ATIVA'   -- ATIVA ou BLOQUEADA
) ENGINE = InnoDB;

CREATE TABLE movimentacoes (
  id_mov    INT PRIMARY KEY AUTO_INCREMENT,
  id_conta  INT           NOT NULL,
  tipo      VARCHAR(10)   NOT NULL,                  -- credito ou debito
  valor     DECIMAL(10,2) NOT NULL,
  descricao VARCHAR(40),
  data_hora DATETIME      DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_mov_conta FOREIGN KEY (id_conta) REFERENCES contas (id_conta)
) ENGINE = InnoDB;

CREATE TABLE auditoria (
  id_aud       INT PRIMARY KEY AUTO_INCREMENT,
  id_conta     INT           NOT NULL,
  saldo_antigo DECIMAL(10,2) NOT NULL,
  saldo_novo   DECIMAL(10,2) NOT NULL,
  usuario      VARCHAR(80)   NOT NULL,
  data_hora    DATETIME      NOT NULL
) ENGINE = InnoDB;

-- ---------------------------------------------------------------------
-- Dados iniciais
-- ---------------------------------------------------------------------
INSERT INTO contas (id_conta, titular, saldo, status) VALUES
  (1, 'Ana',   1000.00, 'ATIVA'),
  (2, 'Bruno',  500.00, 'ATIVA'),
  (3, 'Carla',  200.00, 'ATIVA'),
  (4, 'Diego',    0.00, 'ATIVA'),
  (5, 'Elisa',  300.00, 'BLOQUEADA');

INSERT INTO movimentacoes (id_mov, id_conta, tipo, valor, descricao, data_hora) VALUES
  (1, 1, 'credito', 1000.00, 'Depósito inicial', '2026-11-02 09:00:00'),
  (2, 2, 'credito',  600.00, 'Depósito inicial', '2026-11-02 09:10:00'),
  (3, 2, 'debito',   100.00, 'Saque',            '2026-11-05 14:30:00'),
  (4, 3, 'credito',  250.00, 'Depósito inicial', '2026-11-03 10:00:00'),
  (5, 3, 'debito',    50.00, 'Saque',            '2026-11-06 16:45:00'),
  (6, 5, 'credito',  300.00, 'Depósito inicial', '2026-11-04 11:20:00');

-- ---------------------------------------------------------------------
-- Conferência
-- ---------------------------------------------------------------------
SELECT * FROM contas;          -- 5 contas (Elisa BLOQUEADA), soma = 2000.00
SELECT * FROM movimentacoes;   -- 6 movimentações
