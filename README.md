# Melhores Compras - Data Mart Estoque e Orçamento Cloud

Inclui modelagem dimensional (star schema) para data mart de estoque, scripts SQL, cálculos de sizing/storage, e orçamentos em AWS/Azure.

## Objetivos
- **Data Mart Estoque**: Modelo dimensional para responder perguntas como tempo de reposição, estoque mínimo, rotatividade, valores por localização, impacto de promoções.
- **Orçamento Cloud**: Cálculos para migração (servidores Windows/Linux, storage hot/cold) com crescimento de 30%/ano. Comparação AWS vs Azure; escolha: AWS (maior flexibilidade, performance Linux).

## Tecnologias
- **Banco de Dados**: Oracle (scripts DDL em sql/).
- **Modelagem**: Star schema (ver docs/modelo-dimensional-fisico.pdf).
- **Cloud**: AWS (EC2, S3), Azure (VMs, Storage).
- **Cálculos**: Excel para sizing (5TB estruturados + 2TB não-estruturados; 80% hot, 20% cold).

## Instalação e Uso
1. Clone: `git clone https://github.com/spiiller/melhores-compras-datamart.git`
2. Banco: Rode `sql/apaga.sql` para limpar, então `sql/cria.sql` em Oracle SQL Developer.
3. Modelagem: Abra `docs/modelo-dimensional-fisico.pdf` para visualizar star schema.
4. Cálculos: Abra `calculos/calculo.xlsx` para ver sizing e custos.
5. Orçamentos: Veja `docs/orcamentos.pdf` para detalhes AWS/Azure.

## Funcionalidades Principais
- **Modelo Dimensional**: Tabelas fato (ex: MC_FATURAMENTO_PRODUTO, MC_ITEM_PEDIDO) e dimensões (ex: MC_PRODUTO, MC_CENTRO_DISTRIBUICAO). Atende perguntas executivas.
- **Cálculos Cloud**:
  - Pedidos: 50k/dia (70% 1 item, 30% 2 itens).
  - Servidores: 2 Windows (4 núcleos, 32GB RAM), 4 Linux (4 núcleos, 32GB RAM).
  - Storage: 5TB estruturados + 2TB não-estruturados; crescimento 30%/ano.
  - Custos Mensais: AWS ~1.550 USD; Azure ~1.541 USD.
- **Justificativa Escolha**: AWS melhor por flexibilidade, integração, performance Linux (ver sheet "COMPARAÇÃO AWS E AZURE" no Excel).

## Aprendizados
- Modelagem OLTP vs OLAP (star schema para BI).
- Sizing cloud com hot/cold storage.
- Comparação provedores (AWS vs Azure).
