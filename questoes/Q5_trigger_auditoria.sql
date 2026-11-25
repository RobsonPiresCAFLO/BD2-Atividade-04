-- =====================================================================
-- Atividade-04 · Questão 5 (2,0) – Trigger trg_contas_au (AFTER UPDATE)
-- Aluno(s): ____________________________________________________________
-- =====================================================================
-- O banco precisa guardar o histórico de todas as mudanças de saldo.
-- Crie o trigger trg_contas_au, que dispara DEPOIS de cada UPDATE em
-- contas e, SÓ QUANDO O SALDO MUDOU (OLD.saldo <> NEW.saldo), grava
-- uma linha na tabela auditoria com:
--   id_conta, saldo_antigo (OLD.saldo), saldo_novo (NEW.saldo),
--   usuario (CURRENT_USER()) e data_hora (NOW()).
-- Se o UPDATE mudou só o titular ou o status, não grava nada.
-- =====================================================================
USE DBatividade4;

-- --------------------------- SUA RESPOSTA ----------------------------
DROP TRIGGER IF EXISTS trg_contas_au;
DELIMITER $$
CREATE TRIGGER trg_contas_au
AFTER UPDATE ON contas
FOR EACH ROW
BEGIN

  -- escreva aqui

END $$
DELIMITER ;

-- ------------------------------ TESTES -------------------------------
-- Antes, rode sql/02_voltar_dados_iniciais.sql. Depois, em sequência:
--
-- UPDATE contas SET saldo = saldo + 100 WHERE id_conta = 4;
-- SELECT * FROM auditoria;          -- 1 linha: conta 4, 0.00 -> 100.00
--
-- UPDATE contas SET titular = 'Diego S.' WHERE id_conta = 4;
-- SELECT * FROM auditoria;          -- continua 1 linha
--
-- CALL sacar(2, 50);                -- precisa da Questão 1
-- SELECT * FROM auditoria;          -- 2 linhas: a nova é conta 2, 500.00 -> 450.00
--
-- Pergunta: ninguém chamou o trigger no CALL sacar. Como a linha
-- apareceu na auditoria?
-- Resposta: ______________________________________________________

-- ------------------------- RESULTADO OBTIDO --------------------------
-- Cole aqui (como comentário) o que o MySQL mostrou nos testes,
-- ou salve um print em evidencias/Q5.png
--
