# Cifra XOR Sequencial em SystemVerilog

## Sobre o Projeto

Este repositório contém a minha implementação para um trabalho prático da disciplina de **Introdução aos Sistemas Lógicos** (ISL) na UFMG. O desafio era criar, em uma linguagem de descrição de hardware, um sistema de cifra XOR sequencial.

O objetivo é processar uma entrada de texto (`plaintext`) e aplicar sobre ela uma chave de 8 bits, com a operação sendo controlada por uma Máquina de Estados Finita (FSM) que gerencia o processo bit a bit. Embora o enunciado original solicitasse Verilog, o projeto foi desenvolvido em **SystemVerilog** para aproveitar recursos mais modernos da linguagem, resultando em um código mais limpo e organizado.

## Funcionalidades

* **Módulo Principal (`cipher.sv`):** Implementa a cifra para um texto de 8 bits com uma chave de 8 bits, executando a operação em 8 ciclos de clock.
* **Módulo Bônus (`cipher_bonus.sv`):** Uma versão parametrizada que suporta textos de tamanho `N`, maiores que a chave. A lógica implementa a reutilização cíclica da chave de 8 bits para cobrir toda a extensão do texto.

## Tecnologias Utilizadas

* **SystemVerilog**
* **Simulador HDL** (Icarus Verilog)

## Estrutura do Projeto

```
.
├── doc/
│   └── documentacao.pdf
├── rtl/
│   ├── cipher.sv
│   └── cipher_bonus.sv
├── tb/
│   ├── cipher_tb.sv
│   └── cipher_bonus_tb.sv
└── README.md
```

## Como Simular

### Pré-requisitos

* Um simulador SystemVerilog instalado e configurado.

### Simulação

O projeto contém testbenches (`tb/`) para validar cada módulo.

1.  **Para o módulo principal**, compile e simule os arquivos:
    * `rtl/cipher.sv`
    * `tb/cipher_tb.sv`

2.  **Para o módulo bônus**, compile e simule os arquivos:
    * `rtl/cipher_bonus.sv`
    * `tb/cipher_bonus_tb.sv`

As formas de onda esperadas podem ser consultadas no arquivo `doc/documentacao.pdf`.

## Autor

**Marney Santos de Melo**

## Licença

Este projeto está sob a licença MIT.