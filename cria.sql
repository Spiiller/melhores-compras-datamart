-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2025-03-11 22:41:15 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



DROP TABLE db_cli_juridica CASCADE CONSTRAINTS;

DROP TABLE mc_bairro CASCADE CONSTRAINTS;

DROP TABLE mc_cargo CASCADE CONSTRAINTS;

DROP TABLE mc_categoria_prod CASCADE CONSTRAINTS;

DROP TABLE mc_centro_distribuicao CASCADE CONSTRAINTS;

DROP TABLE mc_cidade CASCADE CONSTRAINTS;

DROP TABLE mc_cli_fisica CASCADE CONSTRAINTS;

DROP TABLE mc_cliente CASCADE CONSTRAINTS;

DROP TABLE mc_depto CASCADE CONSTRAINTS;

DROP TABLE mc_end_centro_distr CASCADE CONSTRAINTS;

DROP TABLE mc_end_cli CASCADE CONSTRAINTS;

DROP TABLE mc_end_func CASCADE CONSTRAINTS;

DROP TABLE mc_estado CASCADE CONSTRAINTS;

DROP TABLE mc_faturamento_produto CASCADE CONSTRAINTS;

DROP TABLE mc_forma_pagamento CASCADE CONSTRAINTS;

DROP TABLE mc_fornecedor CASCADE CONSTRAINTS;

DROP TABLE mc_funcionario CASCADE CONSTRAINTS;

DROP TABLE mc_item_pedido CASCADE CONSTRAINTS;

DROP TABLE mc_logradouro CASCADE CONSTRAINTS;

DROP TABLE mc_pedido CASCADE CONSTRAINTS;

DROP TABLE mc_produto CASCADE CONSTRAINTS;

DROP TABLE mc_produto_centro_distr CASCADE CONSTRAINTS;

DROP TABLE mc_produto_imagem CASCADE CONSTRAINTS;

DROP TABLE mc_promocao CASCADE CONSTRAINTS;

DROP TABLE mc_sub_categoria_prod CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE db_cli_juridica (
    nr_cliente   NUMBER(10) NOT NULL,
    dt_fundacao  DATE,
    nr_cnpj      VARCHAR2(20),
    nr_inscr_est VARCHAR2(15)
)
LOGGING;

COMMENT ON COLUMN db_cli_juridica.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. '
    ;

COMMENT ON COLUMN db_cli_juridica.dt_fundacao IS
    'Essa coluna irá armazenar data  de fundação do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.'
    ;

COMMENT ON COLUMN db_cli_juridica.nr_cnpj IS
    'Essa coluna irá armazenar o  numero do CNPJ do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.'
    ;

COMMENT ON COLUMN db_cli_juridica.nr_inscr_est IS
    'Essa coluna irá armazenar o  numero da Inscrição Estadual  do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser opcional'
    ;

ALTER TABLE db_cli_juridica ADD CONSTRAINT db_cli_juridica_pk PRIMARY KEY ( nr_cliente );

CREATE TABLE mc_bairro (
    cd_bairro      NUMBER(8) NOT NULL,
    cd_cidade      NUMBER(8) NOT NULL,
    nm_bairro      VARCHAR2(45),
    nm_zona_bairro VARCHAR2(20)
)
LOGGING
    ENABLE ROW MOVEMENT;

COMMENT ON COLUMN mc_bairro.cd_bairro IS
    'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_bairro.cd_cidade IS
    'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_bairro.nm_bairro IS
    'Esta coluna ira receber o nome do Bairro. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_bairro.nm_zona_bairro IS
    'Esta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.'
    ;

ALTER TABLE mc_bairro ADD CONSTRAINT mc_bairro_pk PRIMARY KEY ( cd_bairro );

CREATE TABLE mc_cargo (
    cd_cargo NUMBER NOT NULL,
    cd_depto NUMBER(3) NOT NULL,
    ds_cargo VARCHAR2(50) NOT NULL,
    st_cargo CHAR(1) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_cargo.cd_cargo IS
    'Armazena o código único do cargo. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_cargo.ds_cargo IS
    'Armazena a descrição do cargo. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_cargo.st_cargo IS
    'Armazena o status do cargo. Valores permitidos: A(tivo) e I(nativo).

';

ALTER TABLE mc_cargo ADD CONSTRAINT mc_cargo_pk PRIMARY KEY ( cd_cargo );

CREATE TABLE mc_categoria_prod (
    cd_categoria_prod  NUMBER NOT NULL,
    ds_categoria_prod  VARCHAR2(100) NOT NULL,
    st_categoria_prod  CHAR(1) NOT NULL,
    nm_categoria       VARCHAR2(15) NOT NULL,
    segmento_categoria VARCHAR2(20) NOT NULL,
    prioridade         VARCHAR2(10)
)
LOGGING;

COMMENT ON COLUMN mc_categoria_prod.cd_categoria_prod IS
    'Esta coluna irá receber o codigo das categorias  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_categoria_prod.ds_categoria_prod IS
    'Descricao da categoria.';

COMMENT ON COLUMN mc_categoria_prod.st_categoria_prod IS
    'Status da categoria, inativo ou ativo.';

COMMENT ON COLUMN mc_categoria_prod.nm_categoria IS
    'Nome da categoria dos produtos.';

COMMENT ON COLUMN mc_categoria_prod.segmento_categoria IS
    'Segmentos dos produtos.';

COMMENT ON COLUMN mc_categoria_prod.prioridade IS
    'Prioridades entre alta, media ou baixa.';

ALTER TABLE mc_categoria_prod ADD CONSTRAINT mc_categoria_prod_pk PRIMARY KEY ( cd_categoria_prod );

CREATE TABLE mc_centro_distribuicao (
    nr_loja        NUMBER(5) NOT NULL,
    nm_loja        VARCHAR2(100) NOT NULL,
    dt_inauguracao DATE
)
LOGGING;

COMMENT ON COLUMN mc_centro_distribuicao.nr_loja IS
    'Esta coluna irá receber o numero da loja e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_centro_distribuicao.nm_loja IS
    'Esta coluna irá receber o nome da loja e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_centro_distribuicao.dt_inauguracao IS
    'Armazena a data de inauguração da loja. O conteúdo é opcional';

ALTER TABLE mc_centro_distribuicao ADD CONSTRAINT mc_centro_distribuicao_pk PRIMARY KEY ( nr_loja );

CREATE TABLE mc_cidade (
    cd_cidade NUMBER(8) NOT NULL,
    sg_estado CHAR(2) NOT NULL,
    nm_cidade VARCHAR2(60) NOT NULL,
    cd_ibge   NUMBER(8),
    nr_ddd    NUMBER(3)
)
LOGGING
    ENABLE ROW MOVEMENT;

COMMENT ON COLUMN mc_cidade.cd_cidade IS
    'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_cidade.sg_estado IS
    'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_cidade.nm_cidade IS
    'Esta coluna ira receber o nome da Cidade. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_cidade.cd_ibge IS
    'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.';

COMMENT ON COLUMN mc_cidade.nr_ddd IS
    'Esta coluna irá receber o número do DDD da cidade para ser utilizado no contato telefônico. Seu conteudo é opcional.';

ALTER TABLE mc_cidade ADD CONSTRAINT mc_cidade_pk PRIMARY KEY ( cd_cidade );

CREATE TABLE mc_cli_fisica (
    nr_cliente        NUMBER(10) NOT NULL,
    dt_nascimento     DATE NOT NULL,
    fl_sexo_biologico CHAR(1) NOT NULL,
    ds_genero         VARCHAR2(100),
    nr_cpf            VARCHAR2(14) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_cli_fisica.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da tabela NC_CLIENTE. '
    ;

COMMENT ON COLUMN mc_cli_fisica.dt_nascimento IS
    'Essa coluna irá armazenar a data de nascimento do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. '
    ;

COMMENT ON COLUMN mc_cli_fisica.fl_sexo_biologico IS
    'Essa coluna irá armazenar o sexo biológico do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.. '
    ;

COMMENT ON COLUMN mc_cli_fisica.ds_genero IS
    'Genero do sexo do Cliente. Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_cli_fisica.nr_cpf IS
    'Essa coluna irá armazenar o número do CPF do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório. '
    ;

ALTER TABLE mc_cli_fisica ADD CONSTRAINT mc_cli_fisica_pk PRIMARY KEY ( nr_cliente );

CREATE TABLE mc_cliente (
    nr_cliente      NUMBER(10) NOT NULL,
    nm_cliente      VARCHAR2(160) NOT NULL,
    qt_estrelas     NUMBER(1),
    vl_medio_compra NUMBER(10, 2),
    st_cliente      CHAR(1),
    ds_email        VARCHAR2(100),
    nr_telefone     VARCHAR2(20),
    nm_login        VARCHAR2(50) NOT NULL,
    ds_senha        VARCHAR2(50) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_cliente.nr_cliente IS
    'Essa coluna irá armazenar o código único do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório, único e preenhcido a  parrtir da chamada de sequence  SQ_MC_CLIENTE, a qual terá sempre o número disponivel para uso.'
    ;

COMMENT ON COLUMN mc_cliente.nm_cliente IS
    'Essa coluna irá armazenar o nome do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.';

COMMENT ON COLUMN mc_cliente.qt_estrelas IS
    'Essa coluna irá armazenar a quantiade de estrelas do cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e ser possível de estar entre 1 e 5 estrelas.'
    ;

COMMENT ON COLUMN mc_cliente.vl_medio_compra IS
    'Essa coluna irá armazenar o valor  médio de gastos f eito pelo cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório e deve ser calculado diariamente.'
    ;

COMMENT ON COLUMN mc_cliente.st_cliente IS
    'Essa coluna irá armazenar o stauts do cliente da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN mc_cliente.ds_email IS
    'Essa coluna irá armazenar o email  do cliente da Melhorees Compras. No minimo é esperado um email contendo o caractere (@) em seu conteúdo.'
    ;

COMMENT ON COLUMN mc_cliente.nr_telefone IS
    'Essa coluna irá armazenar o número do cliente da Melhorees Compras. A mascara de armazenamento deve ser: (<nr_ddd>) 99999-9999 e  deve ser utilizada pré definida.'
    ;

COMMENT ON COLUMN mc_cliente.nm_login IS
    'Essa coluna irá armazenar o login de cada cliente na plataforma ecommerce da Melhores Compras. Seu conteúdo deve ser obrigatório e  único para cada cliente.'
    ;

COMMENT ON COLUMN mc_cliente.ds_senha IS
    'Essa coluna irá armazenar a senha de cada cliente na plataforma ecommerce da Melhores Compras.Seu conteúdo deve ser obrigatório.'
    ;

ALTER TABLE mc_cliente ADD CONSTRAINT mc_cliente_pk PRIMARY KEY ( nr_cliente );

CREATE TABLE mc_depto (
    cd_depto NUMBER(3) NOT NULL,
    nr_loja  NUMBER(5) NOT NULL,
    nm_depto VARCHAR2(100) NOT NULL,
    st_depto CHAR(1) NOT NULL
)
LOGGING
    ENABLE ROW MOVEMENT;

COMMENT ON COLUMN mc_depto.nr_loja IS
    'Armazena o número da loja onde o pedido foi realizado. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_depto.nm_depto IS
    'Esta coluna irá receber o nome do  departamento  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_depto.st_depto IS
    'Esta coluna irá receber o status do  departamento  e seu conteúdo é obrigatório. Os valores possíveis são: (A)tivo e (I)nativo.'
    ;

ALTER TABLE mc_depto ADD CONSTRAINT mc_depto_pk PRIMARY KEY ( cd_depto );

CREATE TABLE mc_end_centro_distr (
    cd_loja_end        NUMBER(10) NOT NULL,
    nr_loja            NUMBER(5) NOT NULL,
    cd_logradouro      NUMBER(10) NOT NULL,
    ds_complemento_end VARCHAR2(80),
    nr_end             NUMBER(8) NOT NULL,
    dt_inicio          DATE NOT NULL,
    dt_termino         DATE,
    st_end             CHAR(1) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_end_centro_distr.cd_loja_end IS
    'Armazena o código único do endereço da loja. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_end_centro_distr.ds_complemento_end IS
    'Armazena o complemento do endereço. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_end_centro_distr.nr_end IS
    'Armazena o número do endereço. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_end_centro_distr.dt_inicio IS
    'Armazena a data de início do endereço. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_end_centro_distr.dt_termino IS
    'Armazena a data de término do endereço. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_end_centro_distr.st_end IS
    'Armazena o status do endereço. Valores permitidos: A(tivo) e I(nativo).

';

ALTER TABLE mc_end_centro_distr ADD CONSTRAINT mc_end_centro_distr_pk PRIMARY KEY ( cd_loja_end );

CREATE TABLE mc_end_cli (
    nr_cliente         NUMBER(10) NOT NULL,
    cd_logradouro_cli  NUMBER(10) NOT NULL,
    nr_end             NUMBER(8) NOT NULL,
    ds_complemento_end VARCHAR2(80),
    dt_inicio          DATE,
    dt_termino         DATE,
    st_end             CHAR(1),
    mc_cliente_id      NUMBER NOT NULL,
    mc_logradouro_id   NUMBER NOT NULL,
    cd_logradouro      NUMBER NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_end_cli.nr_cliente IS
    'Esta coluna irá receber o número do cliente e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_end_cli.cd_logradouro_cli IS
    'Esta coluna irá receber o código do logradouro  do cliente e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_end_cli.nr_end IS
    'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.';

COMMENT ON COLUMN mc_end_cli.ds_complemento_end IS
    'Esta coluna irá receber o complemento do endereço do cliente e seu conteúdo pode ser opcional.';

COMMENT ON COLUMN mc_end_cli.dt_inicio IS
    'Data de início do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_cli.dt_termino IS
    'Data de término do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_cli.st_end IS
    'Status do endereço. (A)itvo ou (I)nativo.';

ALTER TABLE mc_end_cli ADD CONSTRAINT mc_end_cli_pk PRIMARY KEY ( nr_cliente,
                                                                  cd_logradouro_cli );

ALTER TABLE mc_end_cli ADD CONSTRAINT pk_mc_end_cli UNIQUE ( nr_cliente,
                                                             cd_logradouro_cli );

CREATE TABLE mc_end_func (
    cd_funcionario     NUMBER(10) NOT NULL,
    cd_logradouro      NUMBER(10) NOT NULL,
    nr_end             NUMBER(8) NOT NULL,
    ds_complemento_end VARCHAR2(80),
    dt_inicio          DATE NOT NULL,
    dt_termino         DATE,
    st_end             CHAR(1) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_end_func.cd_funcionario IS
    ' Armazena o código único do funcionário. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_end_func.cd_logradouro IS
    'Armazena o código do logradouro do funcionário. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_end_func.nr_end IS
    'Número do Endereço do Cliente. O número da Rua/Localidade onde o cliente está associado.';

COMMENT ON COLUMN mc_end_func.ds_complemento_end IS
    ' Armazena o complemento do endereço do funcionário. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_end_func.dt_inicio IS
    'Data de início do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_func.dt_termino IS
    'Data de término do endereço associado ao cliente.';

COMMENT ON COLUMN mc_end_func.st_end IS
    'Armazena o status do endereço. Valores permitidos: A(tivo) e I(nativo).
';

ALTER TABLE mc_end_func ADD CONSTRAINT mc_end_func_pk PRIMARY KEY ( cd_funcionario,
                                                                    cd_logradouro );

CREATE TABLE mc_estado (
    sg_estado CHAR(2) NOT NULL,
    nm_estado VARCHAR2(30) NOT NULL
)
LOGGING
    ENABLE ROW MOVEMENT;

COMMENT ON COLUMN mc_estado.sg_estado IS
    'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.';

COMMENT ON COLUMN mc_estado.nm_estado IS
    'Esta coluna irá receber o nome do estado';

ALTER TABLE mc_estado ADD CONSTRAINT mc_estado_pk PRIMARY KEY ( sg_estado );

CREATE TABLE mc_faturamento_produto (
    cd_produto          NUMBER(10) NOT NULL,
    nr_ano_mes          NUMBER(6) NOT NULL,
    qt_prd_vendidos     NUMBER(10, 2),
    vl_tot_prd_vendidos NUMBER(10, 2),
    vl_lucro_produto    NUMBER(10, 2)
)
LOGGING;

COMMENT ON COLUMN mc_faturamento_produto.cd_produto IS
    'Armazena o código do produto. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_faturamento_produto.nr_ano_mes IS
    'Armazena o ano e mês do faturamento. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_faturamento_produto.qt_prd_vendidos IS
    'Armazena a quantidade de produtos vendidos. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_faturamento_produto.vl_tot_prd_vendidos IS
    'Armazena o valor total dos produtos vendidos. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_faturamento_produto.vl_lucro_produto IS
    'Armazena o lucro obtido com o produto. O conteúdo é opcional.
';

ALTER TABLE mc_faturamento_produto ADD CONSTRAINT mc_faturamento_produto_pk PRIMARY KEY ( nr_ano_mes,
                                                                                          cd_produto );

CREATE TABLE mc_forma_pagamento (
    cd_forma_pagto NUMBER NOT NULL,
    ds_forma_pagto VARCHAR2(30) NOT NULL,
    st_forma_pagto CHAR(1) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_forma_pagamento.cd_forma_pagto IS
    'Armazena o código único da forma de pagamento. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_forma_pagamento.ds_forma_pagto IS
    'Armazena a descrição da forma de pagamento. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_forma_pagamento.st_forma_pagto IS
    'Armazena o status da forma de pagamento. Valores permitidos: A(tivo) e I(nativo).
';

ALTER TABLE mc_forma_pagamento ADD CONSTRAINT mc_forma_pagamento_pk PRIMARY KEY ( cd_forma_pagto );

CREATE TABLE mc_fornecedor (
    cd_fornecedor  NUMBER(10) NOT NULL,
    cd_logradouro  NUMBER(10) NOT NULL,
    nm_fornecedor  VARCHAR2(15) NOT NULL,
    tm_entregas    NUMBER(10, 2) NOT NULL,
    confiabilidade NUMBER(10) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_fornecedor.cd_fornecedor IS
    'Chave primária gerada pela sequence `SQ_MC_FORNECEDOR`. ';

COMMENT ON COLUMN mc_fornecedor.cd_logradouro IS
    'Chave estrangeira para `mc_logradouro`. Obrigatório. ';

COMMENT ON COLUMN mc_fornecedor.nm_fornecedor IS
    'Nome do fornecedor (ex: "Fornecedor XYZ"). Obrigatório.     ';

COMMENT ON COLUMN mc_fornecedor.tm_entregas IS
    'Tempo medio de entregas em dias.';

COMMENT ON COLUMN mc_fornecedor.confiabilidade IS
    'Confiabilidade de 1 a 10.';

ALTER TABLE mc_fornecedor ADD CONSTRAINT mc_fornecedor_pk PRIMARY KEY ( cd_fornecedor );

CREATE TABLE mc_funcionario (
    cd_funcionario    NUMBER(10) NOT NULL,
    cd_gerente        NUMBER(10) NOT NULL,
    cd_cargo          NUMBER NOT NULL,
    nm_funcionario    VARCHAR2(160),
    dt_nascimento     DATE NOT NULL,
    fl_sexo_biologico CHAR(1),
    ds_genero         VARCHAR2(100),
    ds_cargo          VARCHAR2(80) NOT NULL,
    vl_salario_bruto  NUMBER(10, 2),
    ds_email          VARCHAR2(80),
    st_func           CHAR(1),
    dt_cadastramento  DATE,
    dt_desligamento   DATE,
    vl_salario_famila NUMBER(10, 2),
    qt_tot_dependente NUMBER(5),
    nr_perc_comissao  NUMBER(5, 2),
    ft_funcionario    BLOB
)
LOGGING
    ENABLE ROW MOVEMENT;

COMMENT ON COLUMN mc_funcionario.cd_funcionario IS
    'Esta coluna irá receber o codigo do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.cd_gerente IS
    'Esta coluna irá receber o codigo do gestor do funcionario trabalha  e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.cd_cargo IS
    'Esta coluna irá receber o codigo do cargo de seus funcionários  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.nm_funcionario IS
    'Esta coluna irá receber o nome do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.dt_nascimento IS
    'Esta coluna irá receber a data de nascimento  do funcionário e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_funcionario.fl_sexo_biologico IS
    'Esta coluna irá receber o sexo biológico do funcionário e seu conteúdo é obrigatório.Os valores permitidos aqui seriam: (F)eminino; (M)asculino ou (Hermafrodita)'
    ;

COMMENT ON COLUMN mc_funcionario.ds_genero IS
    'Esta coluna irá receber o genero atribuido ao funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.ds_cargo IS
    'Esta coluna irá receber o cargo do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.vl_salario_bruto IS
    'Esta coluna irá receber o valor do salário do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.ds_email IS
    'Esta coluna irá receber o email do funcionário e seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.st_func IS
    'Essa coluna irá armazenar o stauts do funcionário da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN mc_funcionario.dt_cadastramento IS
    'Armazena a data de cadastramento do funcionário. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_funcionario.dt_desligamento IS
    'Data de desligamento  do Funcionario. Seu conteúdo é opcional.';

COMMENT ON COLUMN mc_funcionario.vl_salario_famila IS
    ' Armazena o valor do salário familiar do funcionário. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_funcionario.qt_tot_dependente IS
    'Armazena o número total de dependentes do funcionário. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_funcionario.nr_perc_comissao IS
    'Armazena o percentual de comissão do funcionário. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_funcionario.ft_funcionario IS
    'Armazena a foto do funcionário. O conteúdo é opcional.
';

ALTER TABLE mc_funcionario ADD CONSTRAINT mc_funcionario_pk PRIMARY KEY ( cd_funcionario );

CREATE TABLE mc_item_pedido (
    nr_loja          NUMBER(5) NOT NULL,
    nr_pedido        NUMBER NOT NULL,
    nr_item          NUMBER(3) NOT NULL,
    cd_produto_loja  NUMBER(10) NOT NULL,
    qt_pedido        NUMBER(8, 2),
    vl_unitario      NUMBER(8, 2),
    vl_lucro_liquido NUMBER(8, 2),
    st_item_pedido   CHAR(1)
)
LOGGING;

COMMENT ON COLUMN mc_item_pedido.nr_loja IS
    'Chave estrangeira para `mc_centro_distribuicao`. Obrigatório.           ';

COMMENT ON COLUMN mc_item_pedido.nr_pedido IS
    'Número do pedido (parte da PK composta). Obrigatório.       ';

COMMENT ON COLUMN mc_item_pedido.nr_item IS
    'Número sequencial do item no pedido (ex: 1, 2, 3). Obrigatório.';

COMMENT ON COLUMN mc_item_pedido.cd_produto_loja IS
    'Chave estrangeira para `mc_produto_centro_distr`. Obrigatório.           ';

COMMENT ON COLUMN mc_item_pedido.qt_pedido IS
    'Quantidade do produto solicitada (ex: 2 unidades). Obrigatório.';

COMMENT ON COLUMN mc_item_pedido.vl_unitario IS
    'Preço unitário do produto no momento da compra. Obrigatório. ';

COMMENT ON COLUMN mc_item_pedido.vl_lucro_liquido IS
    ' Armazena o lucro líquido do produto. O conteúdo é opcional.
	';

COMMENT ON COLUMN mc_item_pedido.st_item_pedido IS
    ' Status: `P` (Pendente), `E` (Entregue), `C` (Cancelado). Obrigatório. ';

ALTER TABLE mc_item_pedido
    ADD CONSTRAINT mc_item_pedido_pk PRIMARY KEY ( nr_loja,
                                                   nr_item,
                                                   nr_pedido );

CREATE TABLE mc_logradouro (
    cd_logradouro NUMBER(10) NOT NULL,
    cd_bairro     NUMBER(8) NOT NULL,
    nm_logradouro VARCHAR2(160) NOT NULL,
    nr_cep        NUMBER(8)
)
LOGGING
    ENABLE ROW MOVEMENT;

COMMENT ON COLUMN mc_logradouro.cd_logradouro IS
    'Esta coluna irá receber o código do logradouro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_logradouro.cd_bairro IS
    'Esta coluna irá receber o codigo do bairro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_logradouro.nm_logradouro IS
    'Esta coluna irá receber o nome do logradouro e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_logradouro.nr_cep IS
    'Esta coluna irá receber o numero do CEP do Logradouro e seu conteúdo é obrigatório.';

ALTER TABLE mc_logradouro ADD CONSTRAINT mc_logradouro_pkv2 PRIMARY KEY ( cd_logradouro );

CREATE TABLE mc_pedido (
    nr_loja1           NUMBER(5) NOT NULL,
    nr_pedido          NUMBER NOT NULL,
    cd_forma_pagto     NUMBER NOT NULL,
    nr_cliente         NUMBER(10) NOT NULL,
    cd_logradouro_cli1 NUMBER(10) NOT NULL,
    cd_func_atd        NUMBER(10) NOT NULL,
    cd_func_motoboy    NUMBER(10) NOT NULL,
    nr_promocao        NUMBER NOT NULL,
    dt_pedido          DATE NOT NULL,
    vl_frete           NUMBER(10, 2) NOT NULL,
    st_pedido          CHAR(1) NOT NULL,
    cd_logradouro_cli  NUMBER(10) NOT NULL,
    cd_logradouro      NUMBER NOT NULL,
    dt_prev_entrega    DATE,
    vl_tot_pedido      NUMBER(10, 2)
)
LOGGING;

COMMENT ON COLUMN mc_pedido.nr_loja1 IS
    'Armazena o número da loja onde o pedido foi realizado. O conteúdo é obrigatório.';

COMMENT ON COLUMN mc_pedido.nr_pedido IS
    'Número único do pedido, gerado por sequence. Obrigatório.    ';

COMMENT ON COLUMN mc_pedido.cd_forma_pagto IS
    'Chave estrangeira para `mc_forma_pagamento`. Obrigatório.  ';

COMMENT ON COLUMN mc_pedido.nr_cliente IS
    ' Armazena o código do cliente que realizou o pedido. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_pedido.cd_func_atd IS
    'Armazena o código do funcionário que atendeu o pedido. O conteúdo é obrigatório.';

COMMENT ON COLUMN mc_pedido.cd_func_motoboy IS
    ' Armazena o código do motoboy responsável pela entrega. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_pedido.nr_promocao IS
    'Armazena o número da promoção aplicada ao pedido. O conteúdo é opcional.';

COMMENT ON COLUMN mc_pedido.dt_pedido IS
    'Data do pedido no formato `DD/MM/YYYY`. Obrigatório.       ';

COMMENT ON COLUMN mc_pedido.vl_frete IS
    'Armazena o valor do frete. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_pedido.st_pedido IS
    'Armazena o status do pedido. Valores permitidos: (E)m Andamento, (C)ancelado, (F)inalizado.

';

COMMENT ON COLUMN mc_pedido.cd_logradouro_cli IS
    'Armazena o código do logradouro do cliente. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_pedido.dt_prev_entrega IS
    ' Armazena a data prevista para entrega. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_pedido.vl_tot_pedido IS
    'Armazena o valor total do pedido. O conteúdo é opcional.
';

ALTER TABLE mc_pedido ADD CONSTRAINT mc_pedido_pk PRIMARY KEY ( nr_pedido,
                                                                nr_loja1 );

CREATE TABLE mc_produto (
    cd_produto            NUMBER(10) NOT NULL,
    cd_sub_categoria_prod NUMBER NOT NULL,
    cd_fornecedor         NUMBER(10) NOT NULL,
    nr_cd_barras_prod     VARCHAR2(50),
    ds__produto           VARCHAR2(80),
    vl__unitario          NUMBER(8, 2),
    tp__embalagem         VARCHAR2(15),
    st__produto           CHAR(1),
    vl__perc__lucro       NUMBER(8, 2),
    ds__completa          VARCHAR2(4000),
    nm_produto            VARCHAR2(25) NOT NULL,
    marca_produto         VARCHAR2(25) NOT NULL,
    cor_produto           VARCHAR2(10) NOT NULL,
    dm_produto            INTEGER NOT NULL,
    sku_produto           VARCHAR2(16) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_produto.cd_produto IS
    'Essa coluna irá armazenar a chave primária da tabela de produtos da Melhorees Compras. A cada produto cadastrado será acionada a Sequence  SQ_MC_PRODUTO que se encarregará de gerar o próximo número único do produto.'
    ;

COMMENT ON COLUMN mc_produto.cd_sub_categoria_prod IS
    'Chave estrangeira para `mc_sub_categoria_prod`. Obrigatório.    ';

COMMENT ON COLUMN mc_produto.cd_fornecedor IS
    'Chave estrangeira para `mc_fornecedor`. Obrigatório.      ';

COMMENT ON COLUMN mc_produto.nr_cd_barras_prod IS
    'Essa coluna irá armazenar o número do codigo de barras  do produto. Seu conteúdo deve ser opcional.';

COMMENT ON COLUMN mc_produto.ds__produto IS
    'Essa coluna irá armazenar a descrição principal do produto. Seu conteúdo deve ser  obrigatorio.';

COMMENT ON COLUMN mc_produto.vl__unitario IS
    'Essa coluna irá armazenar o valor unitário do produto. Seu conteúdo deve ser > 0 ';

COMMENT ON COLUMN mc_produto.tp__embalagem IS
    'Essa coluna irá armazenar o tipo de embalagem do produto. Seu conteúdo pode ser opcional.';

COMMENT ON COLUMN mc_produto.st__produto IS
    'Essa coluna irá armazenar o stauts do produto da Melhorees Compras. Os valores permitidos aqui são: A(tivo) e I(nativo).';

COMMENT ON COLUMN mc_produto.vl__perc__lucro IS
    'Essa coluna irá armazenar o percentual  do lucro médio para cada produto. Seu conteúdo deve ser opcional.';

COMMENT ON COLUMN mc_produto.ds__completa IS
    'Essa coluna irá armazenar a descrição completa do produto. Seu conteúdo deve ser  obrigatorio.';

COMMENT ON COLUMN mc_produto.nm_produto IS
    ' Armazena o nome do produto. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_produto.marca_produto IS
    'Armazena a marca do produto. O conteúdo é obrigatório.';

COMMENT ON COLUMN mc_produto.cor_produto IS
    'Armazena a cor do produto. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_produto.dm_produto IS
    'Armazena as dimensões do produto. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_produto.sku_produto IS
    'Armazena o SKU (Stock Keeping Unit) do produto. O conteúdo é obrigatório.
';

ALTER TABLE mc_produto
    ADD CONSTRAINT mc_produto_ck_st_prod CHECK ( st_produto IN ( 'A', 'I' ) );

ALTER TABLE mc_produto ADD CONSTRAINT mc_produto_pk PRIMARY KEY ( cd_produto );

ALTER TABLE mc_produto ADD CONSTRAINT pk_mc_produto UNIQUE ( cd_produto );

CREATE TABLE mc_produto_centro_distr (
    cd_produto_loja   NUMBER(10) NOT NULL,
    nr_loja           NUMBER(5) NOT NULL,
    cd_produto        NUMBER(10) NOT NULL,
    qt_estoque_atual  NUMBER(10, 2) NOT NULL,
    qt_estoque_minimo NUMBER(10, 2) NOT NULL,
    dt_cadastro       DATE NOT NULL,
    st_atual          CHAR(1) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_produto_centro_distr.cd_produto_loja IS
    'Armazena o código único do produto na loja. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_produto_centro_distr.qt_estoque_atual IS
    'Armazena a quantidade atual do produto em estoque. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_produto_centro_distr.qt_estoque_minimo IS
    'Armazena a quantidade mínima de estoque do produto. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_produto_centro_distr.dt_cadastro IS
    'Armazena a data de cadastro do produto no estoque. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_produto_centro_distr.st_atual IS
    'Armazena o status atual do produto no estoque. Valores permitidos: A(tivo) e I(nativo).
';

ALTER TABLE mc_produto_centro_distr ADD CONSTRAINT mc_produto_centro_distr_pk PRIMARY KEY ( cd_produto_loja );

CREATE TABLE mc_produto_imagem (
    cd_produto        NUMBER(10) NOT NULL,
    nr_sequencia      NUMBER(3) NOT NULL,
    im_produto        BLOB,
    tp_imagem_produto VARCHAR2(10),
    ds_path_imagem    VARCHAR2(500)
)
LOGGING;

COMMENT ON COLUMN mc_produto_imagem.cd_produto IS
    'Esta coluna irá receber o codigo das categorias e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_produto_imagem.nr_sequencia IS
    'Esta coluna irá receber o número das sequências das imagens  e seu conteúdo é obrigatório.';

COMMENT ON COLUMN mc_produto_imagem.im_produto IS
    'Armazena a imagem do produto. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_produto_imagem.tp_imagem_produto IS
    'Armazena o tipo da imagem do produto. O conteúdo é opcional.
';

COMMENT ON COLUMN mc_produto_imagem.ds_path_imagem IS
    ' Armazena o caminho (link) da imagem do produto. O conteúdo é opcional.
';

ALTER TABLE mc_produto_imagem ADD CONSTRAINT mc_produto_imagem_pk PRIMARY KEY ( nr_sequencia,
                                                                                cd_produto );

CREATE TABLE mc_promocao (
    nr_promocao NUMBER NOT NULL,
    ds_promocao VARCHAR2(100) NOT NULL,
    dt_inicio   DATE NOT NULL,
    dt_termino  DATE NOT NULL,
    st_promocao CHAR(1) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_promocao.nr_promocao IS
    'Chave primária gerada pela sequence `SQ_MC_PROMOCAO`. Obrigatório.           ';

COMMENT ON COLUMN mc_promocao.ds_promocao IS
    'Descrição da promoção (ex: "Black Friday 2023"). Obrigatório. ';

COMMENT ON COLUMN mc_promocao.dt_inicio IS
    'Data de início da promoção (formato DD/MM/YYYY). Obrigatório.  ';

COMMENT ON COLUMN mc_promocao.dt_termino IS
    'Data de término da promoção. Obrigatório. ';

COMMENT ON COLUMN mc_promocao.st_promocao IS
    'Status: `A` (Ativa) ou `E` (Expirada). Obrigatório. ';

ALTER TABLE mc_promocao ADD CONSTRAINT mc_promocao_pk PRIMARY KEY ( nr_promocao );

CREATE TABLE mc_sub_categoria_prod (
    cd_sub_categoria_prod NUMBER NOT NULL,
    cd_categoria_prod     NUMBER NOT NULL,
    ds_sub_categoria_prod VARCHAR2(100) NOT NULL,
    st_sub_categoria_prod CHAR(1) NOT NULL,
    nm_sub_categoria_prod VARCHAR2(15) NOT NULL
)
LOGGING;

COMMENT ON COLUMN mc_sub_categoria_prod.cd_sub_categoria_prod IS
    'Chave primária gerada pela sequence `SQ_MC_SUB_CATEGORIA`. Obrigatório.    ';

COMMENT ON COLUMN mc_sub_categoria_prod.cd_categoria_prod IS
    'Armazena o código da categoria de produtos. O conteúdo é obrigatório.
';

COMMENT ON COLUMN mc_sub_categoria_prod.ds_sub_categoria_prod IS
    'Descrição da subcategoria (ex: "Smartphones Android"). Obrigatório.        ';

COMMENT ON COLUMN mc_sub_categoria_prod.st_sub_categoria_prod IS
    'Status: `A` (Ativa) ou `I` (Inativa). Obrigatório.';

COMMENT ON COLUMN mc_sub_categoria_prod.nm_sub_categoria_prod IS
    'Armazena o nome da subcategoria de produtos. O conteúdo é obrigatório.
';

ALTER TABLE mc_depto
    ADD CONSTRAINT fk_mc_depto_centro_distr FOREIGN KEY (nr_loja)
        REFERENCES mc_centro_distribuicao (nr_loja)
    NOT DEFERRABLE;

ALTER TABLE mc_end_centro_distr
    ADD CONSTRAINT fk_mc_end_centro_distr_centro_distr FOREIGN KEY (nr_loja)
        REFERENCES mc_centro_distribuicao (nr_loja)
    NOT DEFERRABLE;

ALTER TABLE mc_end_centro_distr
    ADD CONSTRAINT fk_mc_end_centro_distr_logradouro FOREIGN KEY (cd_logradouro)
        REFERENCES mc_logradouro (cd_logradouro)
    NOT DEFERRABLE;

ALTER TABLE mc_end_cli
    ADD CONSTRAINT fk_mc_end_cli_cliente FOREIGN KEY (nr_cliente)
        REFERENCES mc_cliente (nr_cliente)
    NOT DEFERRABLE;

ALTER TABLE mc_end_cli
    ADD CONSTRAINT fk_mc_end_cli_logradouro FOREIGN KEY (cd_logradouro_cli)
        REFERENCES mc_logradouro (cd_logradouro)
    NOT DEFERRABLE;

ALTER TABLE mc_end_func
    ADD CONSTRAINT fk_mc_end_func_funcionario FOREIGN KEY (cd_funcionario)
        REFERENCES mc_funcionario (cd_funcionario)
    NOT DEFERRABLE;

ALTER TABLE mc_end_func
    ADD CONSTRAINT fk_mc_end_func_logradouro FOREIGN KEY (cd_logradouro)
        REFERENCES mc_logradouro (cd_logradouro)
    NOT DEFERRABLE;

ALTER TABLE mc_faturamento_produto
    ADD CONSTRAINT fk_mc_faturamento_produto FOREIGN KEY (cd_produto)
        REFERENCES mc_produto (cd_produto)
    NOT DEFERRABLE;

ALTER TABLE mc_fornecedor
    ADD CONSTRAINT fk_mc_fornecedor_logradouro FOREIGN KEY (cd_logradouro)
        REFERENCES mc_logradouro (cd_logradouro)
    NOT DEFERRABLE;

ALTER TABLE mc_funcionario
    ADD CONSTRAINT fk_mc_funcionario_cargo FOREIGN KEY (cd_cargo)
        REFERENCES mc_cargo (cd_cargo)
    NOT DEFERRABLE;

ALTER TABLE mc_funcionario
    ADD CONSTRAINT fk_mc_funcionario_gerente FOREIGN KEY (cd_gerente)
        REFERENCES mc_funcionario (cd_funcionario)
    NOT DEFERRABLE;

ALTER TABLE mc_item_pedido
    ADD CONSTRAINT fk_mc_item_pedido_pedido FOREIGN KEY (nr_pedido, nr_loja)
        REFERENCES mc_pedido (nr_pedido, nr_loja1)
    NOT DEFERRABLE;

ALTER TABLE mc_item_pedido
    ADD CONSTRAINT fk_mc_item_pedido_produto_centro FOREIGN KEY (cd_produto_loja)
        REFERENCES mc_produto_centro_distr (cd_produto_loja)
    NOT DEFERRABLE;

ALTER TABLE mc_logradouro
    ADD CONSTRAINT fk_mc_logradouro_bairro FOREIGN KEY (cd_bairro)
        REFERENCES mc_bairro (cd_bairro)
    NOT DEFERRABLE;

ALTER TABLE mc_pedido
    ADD CONSTRAINT fk_mc_pedido_centro_distribuicao FOREIGN KEY (nr_loja1)
        REFERENCES mc_centro_distribuicao (nr_loja)
    NOT DEFERRABLE;

ALTER TABLE mc_pedido
    ADD CONSTRAINT fk_mc_pedido_end_cli FOREIGN KEY (nr_cliente, cd_logradouro_cli1)
        REFERENCES mc_end_cli (nr_cliente, cd_logradouro_cli)
    NOT DEFERRABLE;

ALTER TABLE mc_pedido
    ADD CONSTRAINT fk_mc_pedido_forma_pagamento FOREIGN KEY (cd_forma_pagto)
        REFERENCES mc_forma_pagamento (cd_forma_pagto)
    NOT DEFERRABLE;

ALTER TABLE mc_pedido
    ADD CONSTRAINT fk_mc_pedido_funcionario FOREIGN KEY (cd_func_atd)
        REFERENCES mc_funcionario (cd_funcionario)
    NOT DEFERRABLE;

ALTER TABLE mc_pedido
    ADD CONSTRAINT fk_mc_pedido_funcionario_motoboy FOREIGN KEY (cd_func_motoboy)
        REFERENCES mc_funcionario (cd_funcionario)
    NOT DEFERRABLE;

ALTER TABLE mc_pedido
    ADD CONSTRAINT fk_mc_pedido_promocao FOREIGN KEY (nr_promocao)
        REFERENCES mc_promocao (nr_promocao)
    NOT DEFERRABLE;

ALTER TABLE mc_produto_centro_distr
    ADD CONSTRAINT fk_mc_produto_centro_distr_centro_distr FOREIGN KEY (nr_loja)
        REFERENCES mc_centro_distribuicao (nr_loja)
    NOT DEFERRABLE;

ALTER TABLE mc_produto_centro_distr
    ADD CONSTRAINT fk_mc_produto_centro_produto FOREIGN KEY (cd_produto)
        REFERENCES mc_produto (cd_produto)
    NOT DEFERRABLE;

ALTER TABLE mc_produto_imagem
    ADD CONSTRAINT fk_mc_produto_imagem_produto FOREIGN KEY (cd_produto)
        REFERENCES mc_produto (cd_produto)
    NOT DEFERRABLE;

ALTER TABLE mc_produto
    ADD CONSTRAINT fk_mc_produto_fornecedor FOREIGN KEY (cd_fornecedor)
        REFERENCES mc_fornecedor (cd_fornecedor)
    NOT DEFERRABLE;

ALTER TABLE mc_produto
    ADD CONSTRAINT fk_mc_produto_sub_categoria FOREIGN KEY (cd_sub_categoria_prod)
        REFERENCES mc_sub_categoria_prod (cd_sub_categoria_prod)
    NOT DEFERRABLE;

ALTER TABLE mc_sub_categoria_prod
    ADD CONSTRAINT fk_mc_sub_categoria_prod_categoria FOREIGN KEY (cd_categoria_prod)
        REFERENCES mc_categoria_prod (cd_categoria_prod)
    NOT DEFERRABLE;



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            25
-- CREATE INDEX                             0
-- ALTER TABLE                             59
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- WARNINGS                                 0
