# 💼 Análise de Vendas CRM — SQL & Power BI

## 📌 Sumário

- [Contexto](#-contexto)
- [Objetivo](#-objetivo)
- [Perguntas de Negócio](#-perguntas-de-negócio)
- [Análises Realizadas](#-análises-realizadas)
- [Respostas às Perguntas](#-respostas-às-perguntas)
- [Principais Insights](#-principais-insights)
- [Dashboard](#-dashboard)
- [Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Arquivos do Projeto](#-arquivos-do-projeto)
- [Autor](#-autor)

---

## 📌 Contexto

Este projeto apresenta uma análise de oportunidades de vendas de um sistema de CRM, utilizando um conjunto de dados disponibilizado pela Maven Analytics.

A análise foi desenvolvida utilizando **MySQL** para organização dos dados e consultas SQL, seguida do uso do **Power BI** para modelagem dos dados, criação de medidas em DAX e desenvolvimento dos dashboards.

O conjunto de dados contém informações sobre oportunidades de vendas, vendedores, equipes, produtos, clientes, etapas das negociações, datas e valores das oportunidades fechadas.

---

## 🎯 Objetivo

O objetivo deste projeto é analisar o desempenho comercial e identificar padrões nas oportunidades de vendas.

A análise está concentrada em:

- Desempenho das equipes de vendas;
- Desempenho dos vendedores;
- Evolução trimestral das vendas;
- Taxa de sucesso dos produtos;
- Identificação de possíveis pontos de atenção no desempenho dos vendedores.

---

## ❓ Perguntas de Negócio

A análise foi orientada pelas seguintes perguntas:

1. **How is each sales team performing compared to the rest?**  
   *Como cada equipe de vendas está performando em comparação às demais?*

2. **Are any sales agents lagging behind?**  
   *Existem vendedores com desempenho abaixo dos parâmetros gerais?*

3. **Are there any quarter-over-quarter trends?**  
   *Existem tendências de vendas entre os trimestres?*

4. **Do any products have better win rates?**  
   *Existem produtos com taxas de sucesso superiores às demais?*

---

## 📊 Análises Realizadas

### 🗄️ SQL — MySQL

Os dados foram estruturados e analisados utilizando MySQL, com aplicação de consultas SQL para:

- Avaliar o desempenho das equipes de vendas;
- Comparar o desempenho individual dos vendedores;
- Identificar vendedores abaixo dos parâmetros gerais de desempenho;
- Analisar a evolução das vendas por trimestre;
- Calcular a variação Quarter-over-Quarter (QoQ);
- Calcular a quantidade de oportunidades ganhas e perdidas por produto;
- Calcular a taxa de sucesso (Win Rate) dos produtos.

### 📈 Power BI

Após a análise inicial em SQL, os dados foram utilizados no Power BI para:

- Construção do modelo de dados e relacionamentos;
- Criação de medidas utilizando DAX;
- Desenvolvimento de indicadores (KPIs);
- Criação de gráficos e tabelas para análise dos resultados;
- Desenvolvimento de um dashboard dividido em páginas, cada uma respondendo a uma pergunta de negócio.

---

## 💡 Respostas às Perguntas de Negócio

### 1. Como cada equipe de vendas está performando em comparação às demais?

A análise considerou o valor total das oportunidades ganhas, a quantidade de vendas e o valor médio por oportunidade.

- **Melvin Marxen** apresentou o maior valor total de vendas ganhas, com **R$ 2.251.930,00** em **882 oportunidades**.
- **Rocco Neubert** apresentou o maior valor médio por oportunidade, com **R$ 2.837,26**.
- **Dustin Brinkmann** apresentou o menor valor médio por oportunidade, com **R$ 1.465,01**.
- **Cara Losch** apresentou a menor quantidade de oportunidades ganhas, com **480**.

Os resultados mostram diferenças relevantes entre as equipes tanto em volume de vendas quanto no valor médio das oportunidades.

---

### 2. Existem vendedores com desempenho abaixo dos parâmetros gerais?

Foram considerados dois parâmetros para identificar possíveis pontos de atenção:

- Média de **141,27 oportunidades ganhas por vendedor**;
- Valor médio geral de **R$ 2.360,91 por oportunidade ganha**.

Cinco vendedores ficaram abaixo dos dois parâmetros:

| Vendedor | Oportunidades Ganhas | Valor Médio |
|---|---:|---:|
| Cecily Lampkin | 107 | R$ 2.147,66 |
| Lajuana Vencill | 127 | R$ 1.532,54 |
| Moses Frase | 129 | R$ 1.606,06 |
| Niesha Huffines | 105 | R$ 1.685,34 |
| Violet Mclelland | 122 | R$ 1.011,73 |

Esses vendedores representam **possíveis pontos de atenção** para uma análise mais aprofundada de desempenho.

---

### 3. Existem tendências de vendas entre os trimestres?

A análise trimestral apresentou os seguintes resultados:

| Trimestre | Oportunidades Ganhas | Valor Total | Variação QoQ |
|---|---:|---:|---:|
| 2017 - T1 | 531 | R$ 1.134.672,00 | — |
| 2017 - T2 | 1.254 | R$ 3.086.111,00 | +171,98% |
| 2017 - T3 | 1.257 | R$ 2.982.255,00 | -3,37% |
| 2017 - T4 | 1.196 | R$ 2.802.496,00 | -6,03% |

O segundo trimestre apresentou o maior valor total de vendas e um crescimento de **171,98%** em relação ao primeiro trimestre.

Após o pico do segundo trimestre, houve uma redução no valor total vendido nos dois trimestres seguintes.

---

### 4. Existem produtos com taxas de sucesso superiores às demais?

A taxa de sucesso foi calculada considerando apenas oportunidades **Won** e **Lost**:

**Win Rate = Oportunidades Ganhas ÷ (Oportunidades Ganhas + Oportunidades Perdidas)**

| Produto | Ganhas | Perdidas | Win Rate |
|---|---:|---:|---:|
| MG Special | 793 | 430 | 64,84% |
| GTX Plus Pro | 479 | 266 | 64,30% |
| GTX Basic | 915 | 521 | 63,72% |
| GTX Pro | 729 | 418 | 63,56% |
| GTX Plus Basic | 653 | 398 | 62,13% |
| MG Advanced | 654 | 430 | 60,33% |
| GTK 500 | 15 | 10 | 60,00% |

O **MG Special** apresentou a maior taxa de sucesso entre os produtos analisados, com **64,84%**.

O **GTK 500** possui apenas **25 oportunidades encerradas**, portanto seu resultado deve ser interpretado com cautela devido ao tamanho reduzido da amostra.

---

## 🔎 Principais Insights

- Houve diferenças relevantes no desempenho entre as equipes, tanto em volume de oportunidades ganhas quanto no valor médio das vendas.
- A equipe de **Melvin Marxen** apresentou o maior valor total de oportunidades ganhas, enquanto a equipe de **Rocco Neubert** apresentou o maior valor médio por oportunidade.
- Foram identificados **5 vendedores abaixo dos dois parâmetros gerais utilizados na análise**, representando possíveis pontos de atenção para uma investigação mais aprofundada.
- O **2º trimestre de 2017** apresentou o maior valor total de vendas, com **R$ 3.086.111,00**.
- Após o pico do segundo trimestre, o valor total de vendas apresentou reduções no terceiro e no quarto trimestre.
- O produto **MG Special** apresentou a maior taxa de sucesso, com **64,84%**.
- Os resultados de produtos com poucas oportunidades encerradas, como o **GTK 500**, devem ser interpretados com cautela devido ao tamanho reduzido da amostra.

## 📊 Dashboard

O dashboard foi desenvolvido no Power BI e organizado em cinco páginas. Cada página foi construída para responder a uma das perguntas de negócio definidas no projeto.

### 🏠 Home

Página inicial com uma visão geral dos principais indicadores do projeto.

![Dashboard Home](Images/Dashboard%20Home.png)

---

### 👥 Desempenho das Equipes

Análise do desempenho das equipes de vendas, considerando volume de oportunidades ganhas, valor total e valor médio das oportunidades.

![Dashboard Desempenho das Equipes](Images/Dashboard%20Desempenho%20das%20equipes.png)

---

### 👤 Desempenho dos Vendedores

Identificação de vendedores que apresentam resultados abaixo dos parâmetros gerais utilizados na análise.

![Dashboard Desempenho dos Vendedores](Images/Dashboard%20Desempenho%20dos%20vendedores.png)

---

### 📈 Evolução Trimestral

Análise da evolução das vendas ao longo dos trimestres e da variação Quarter-over-Quarter (QoQ).

![Dashboard Evolução Trimestral](Images/Dashboard%20Evolução%20trimestral.png)

---

### 📦 Desempenho dos Produtos

Comparação das oportunidades ganhas e perdidas e análise da taxa de sucesso (Win Rate) de cada produto.

![Dashboard Desempenho dos Produtos](Images/Dashboard%20Desempenho%20dos%20produtos.png)

---

## 🛠️ Tecnologias Utilizadas

- **MySQL** — criação e organização do banco de dados;
- **SQL** — consultas, agregações e análises dos dados;
- **Power BI** — modelagem, análise e visualização dos dados;
- **DAX** — criação de medidas e indicadores;
- **Power Query** — tratamento e preparação dos dados;
- **GitHub** — versionamento e documentação do projeto.

---

## 📁 Estrutura do Projeto

```text
CRM-Sales-Analysis-PowerBI-SQL/
│
├── SQL/
│   └── CRM_Sales_Analysis (MySQL).sql
│
├── PowerBI/
│   └── CRM_Sales_Analysis (Power BI).pbix
│
├── Images/
│   ├── Dashboard Desempenho das equipes.png
│   ├── Dashboard Desempenho dos produtos.png
│   ├── Dashboard Desempenho dos vendedores.png
│   ├── Dashboard Evolução trimestral.png
│   └── Dashboard Home.png
│
└── README.md
```

---

markdown
## 📄 Arquivos do Projeto

- **[Script SQL](SQL/CRM_Sales_Analysis%20%28MySQL%29.sql)** — contém a criação do banco de dados, estrutura das tabelas e consultas utilizadas nas análises.
- **[Dashboard Power BI](PowerBI/CRM_Sales_Analysis%20%28Power%20BI%29.pbix)** — contém o modelo de dados, medidas DAX e dashboards desenvolvidos no projeto.

---

## 👤 Autor

**Luis Fernando Sosnoski de Souza**

🎓 Engenharia da Computação — Centro Universitário Fundação Santo André

📊 Foco em Análise e Inteligência de Dados

🔗 [LinkedIn](https://www.linkedin.com/in/luis-fernando-sosnoski-de-souza)

💻 [GitHub](https://github.com/lfssouza)
