INSERT INTO KNOWLEDGE_AREA(knowledgeArea) VALUES
  ('Probabilidade e Estatística'),
  ('Sistemas de Informação'),
  ('Planejamento de controle da Produção'),
  ('Gestão da Qualidade'),
  ('Engenharia do Produto'),
  ('Gestão estratégica')
  ON CONFLICT DO NOTHING;

INSERT INTO SUBAREA(knowledgeAreaId, description) VALUES
  (1, 'Análise de Banco de Dados'),
  (1, 'Criação de Questionários de Pesquisa'),
  (1, 'Outras'),
  (2, 'Projeto de Sistemas de Informação'),
  (2, 'Outras'),
  (3, 'Previsão de Demanda'),
  (3, 'Gestão de Estoque'),
  (3, 'Criação de Ferramentas de Apoio ao Planejamento e Controle da Produção'),
  (3, 'Outras'),
  (4, 'Normalização, Auditoria e Certificação para a Qualidade'),
  (4, 'Sistema de Garantia de Qualidade'),
  (4, 'Melhoria de Processos de Produtos e Serviços'),
  (4, 'Controle Estatístico de Processos'),
  (4, 'Melhoria Contínua (MASP-PDCA)'),
  (4, 'Outras'),
  (5, 'Elaboração de Projeto Conceitual de Produto'),
  (5, 'Outras'),
  (6, 'Definição de Objetivos Estratégicos'),
  (6, 'Definição de Objetivos Estratégicos'),
  (6, 'Viabilidade Econômica'),
  (6, 'Desdobramento de Metas'),
  (6, 'Outras')
  ON CONFLICT DO NOTHING;

