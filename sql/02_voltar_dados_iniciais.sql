-- =====================================================================
-- Atividade-04 – 02_voltar_dados_iniciais.sql
--
-- Volta as tabelas aos DADOS INICIAIS sem apagar as suas procedures e
-- triggers. Use antes de testar uma questão, para conferir os
-- resultados esperados que estão nos arquivos da pasta questoes/.
-- (TRUNCATE esvazia a tabela sem disparar triggers.)
-- =====================================================================
USE DBatividade4;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE auditoria;
TRUNCATE TABLE movimentacoes;
TRUNCATE TABLE contas;
SET FOREIGN_KEY_CHECKS = 1;

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

SELECT * FROM contas;
