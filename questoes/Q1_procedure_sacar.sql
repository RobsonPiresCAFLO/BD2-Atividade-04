-- =====================================================================
-- Atividade-04 · Questão 1 (2,0) – Procedure sacar
-- Aluno(s): ____________________________________________________________
-- =====================================================================
-- Crie a procedure  sacar(IN p_conta INT, IN p_valor DECIMAL(10,2))
-- que faz um saque na conta p_conta.
--
-- Antes de sacar, verifique (nesta ordem) e, se algo estiver errado,
-- pare com  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '...':
--   1. p_valor precisa ser maior que zero  -> 'Valor inválido'
--   2. a conta precisa existir              -> 'Conta não encontrada'
--   3. a conta precisa estar 'ATIVA'        -> 'Conta bloqueada'
--   4. o saldo precisa ser >= p_valor       -> 'Saldo insuficiente'
-- Se estiver tudo certo:
--   * diminua o saldo da conta (UPDATE);
--   * registre em movimentacoes: (p_conta, 'debito', p_valor, 'Saque').
--
-- Dica: guarde o saldo e o status numa variável:
--   SELECT saldo, status INTO v_saldo, v_status FROM contas WHERE ...;
--   Se a conta não existir, as variáveis ficam NULL.
-- =====================================================================
USE DBatividade4;

-- --------------------------- SUA RESPOSTA ----------------------------
DROP PROCEDURE IF EXISTS sacar;
DELIMITER $$
CREATE PROCEDURE sacar(IN p_conta INT, IN p_valor DECIMAL(10,2))
BEGIN
  DECLARE v_saldo  DECIMAL(10,2);
  DECLARE v_status VARCHAR(10);

  -- escreva aqui

END $$
DELIMITER ;

-- ------------------------------ TESTES -------------------------------
-- Antes, rode sql/02_voltar_dados_iniciais.sql. Depois, um teste por vez:
--
-- CALL sacar(2, 150);
-- SELECT * FROM contas WHERE id_conta = 2;          -- Bruno: 350.00
-- SELECT * FROM movimentacoes WHERE id_conta = 2;   -- nova linha: debito 150.00 Saque
--
-- CALL sacar(1, 0);       -- ERROR 1644 (45000): Valor inválido
-- CALL sacar(9, 10);      -- ERROR 1644 (45000): Conta não encontrada
-- CALL sacar(5, 10);      -- ERROR 1644 (45000): Conta bloqueada
-- CALL sacar(3, 500);     -- ERROR 1644 (45000): Saldo insuficiente

-- ------------------------- RESULTADO OBTIDO --------------------------
-- Cole aqui (como comentário) o que o MySQL mostrou nos testes,
-- ou salve um print em evidencias/Q1.png
--
