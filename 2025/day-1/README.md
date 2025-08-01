<div align="center">
<h1>Petnica Ethereum Workshop <br>| Edition 2025 |</h1>
</div>

# Table of Contents

<details>
  <summary><a href="#resources">Resources</a></summary>
  <ul>
    <li><a href="#key-resources">Key Resources</a></li>
    <li><a href="#development-tools">Development Tools</a></li>
    <li><a href="#faucets">Faucets</a></li>
    <li><a href="#chainlist">Chainlist</a></li>
    <li><a href="#metamask-installation">Metamask Installation</a></li>
  </ul>
</details>
<hr style="border: 1px dashed #ccc;">
<p style="text-align: right; font-weight: bold;">⬇️ Day 1 ⬇️</p>

<details>
  <summary><a href="#section-0-welcome-to-the-workshop">Section 0: Welcome to the Workshop!</a></summary>
  <ol>
    <li><a href="#welcome-to-the-workshop">Welcome to the Workshop!</a></li>
    <li><a href="#best-practices">Best Practices</a></li>
  </ol>
</details>

<details>
  <summary><a href="#section-1-ethereum-basics">Section 1: Ethereum Basics!</a></summary>
  <ol>
    <li><a href="#what-is-ethereum">What is Ethereum?</a></li>
    <li><a href="#ethereum-accounts">Ethereum accounts</a></li>
    <li><a href="#what-is-a-smart-contract">What is a smart contract?</a></li>
  </ol>
</details>

<details>
  <summary><a href="#section-2-hello-world">Section 2: Hello World</a></summary>
  <ol>
    <li><a href="#welcome-to-remix">Welcome to Remix</a></li>
    <li>
      <a href="#hello-world">Hello world</a>
      <ol>
        <li><a href="#deploying-your-first-contract">Deploying your first contract</a></li>
      </ol>
    </li>
  </ol>
</details>

<details>
  <summary><a href="#section-3-solidity-syntax">Section 3: Solidity Syntax</a></summary>
  <ol>
    <li><a href="#basic-solidity-types">Basic Solidity: Types</a></li>
    <li><a href="#basic-solidity-function">Basic Solidity: Function</a></li>
    <li><a href="#immutable--constant">Immutable & Constant</a></li>
    <li><a href="#basic-solidity-arrays--structs">Basic Solidity: Arrays & Structs</a></li>
    <li><a href="#basic-solidity-compiler-errors-and-warnings">Basic Solidity: Compiler Errors and Warnings</a></li>
    <li><a href="#basic-solidity-memory-storage-calldata-intro">Basic Solidity: Memory, Storage, Calldata (Intro)</a></li>
    <li><a href="#basic-solidity-modifiers">Basic Solidity: Modifiers</a></li>
    <li><a href="#basic-solidity-error-handling">Basic Solidity: Error handling</a></li>
    <li><a href="#receiving-eth-through-a-function">Receiving ETH through a function</a></li>
    <li><a href="#sending-eth-through-a-function">Sending ETH through a function</a></li>
    <li><a href="#factory-pattern">Factory Pattern</a></li>
    <li><a href="#basic-solidity-importing-contracts-into-other-contracts">Basic Solidity: Importing Contracts into other Contracts</a></li>
    <li><a href="#basic-solidity-interacting-with-other-contracts">Basic Solidity: Interacting with other Contracts</a></li>
    <li><a href="#basic-solidity-inheritance--overrides">Basic Solidity: Inheritance & Overrides</a></li>
  </ol>
</details>

<details>
  <summary><a href="#section-4-task">Section 4: Task</a></summary>
  <ol>
    <li><a href="#description">Description</a></li>
    <li><a href="#solutions">Solutions</a></li>
  </ol>
</details>

## Disclaimer

> ⚠️ All code associated with this course is for demo purposes only. They have not been audited and should not be considered production ready. Please use at your own risk.

# Resources

# Key Resources

- [Ethereum.org website](https://ethereum.org)
- [Ethereum Yellow Paper](https://ethereum.github.io/yellowpaper/paper.pdf)
- [Ethereum Whitepaper](https://ethereum.org/en/whitepaper/)
- [Mastering Ethereum Book](https://github.com/ethereumbook/ethereumbook)
- [Solidity Official Documentation](https://docs.soliditylang.org/en/v0.8.26/)
- [Solidity By Example](https://solidity-by-example.org)

# Development Tools

## Remix

[Remix](https://remix.ethereum.org) will be used in this workshop for live coding.

## Standard Development Tools

- [Hardhat](https://hardhat.org/)
- [Foundry](https://getfoundry.sh/)

# Faucets

- [Sepolia Faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)
- [Alchemy Sepolia Faucet](https://sepoliafaucet.com/)

# Chainlist

- [Chainlist](https://chainlist.org/)

# Metamask Installation

Metamask is essential for following this workshop. Please ensure it is installed:

- [Metamask Installation Guide](https://metamask.io/)

<p align="right">(<a href="#table-of-contents">back to top</a>) ⬆️</p>

# Section 0: Welcome to the Workshop!

## Welcome to the Workshop!

Welcome to the Petnica Ethereum Workshop Edition 2025! In this workshop, we will explore the fundamentals of Ethereum, including the basics of smart contracts and how they work. You’ll gain practical insights into Ethereum’s core concepts and get hands-on experience by writing your first smart contracts.

## Best Practices

- **Follow along with me in live coding sessions**: Actively participate during the live coding sessions. This hands-on approach will help you understand the concepts better and clarify any doubts in real-time.
- **Ask whenever something is not clear**: If something’s confusing, just ask! No question is too basic, and it's better to get clarity right away.
- **Google it or ChatGPT it**: Stuck on something? Hit up Google or ask ChatGPT.

<p align="right">(<a href="#table-of-contents">back to top</a>) ⬆️</p>

# Section 1: Ethereum Basics

## What is Ethereum?

- 📄 [Ethereum Whitepaper](https://ethereum.org/en/whitepaper/)
  - 👤 [Vitalik Buterin](https://en.wikipedia.org/wiki/Vitalik_Buterin)
- 🌐 The world computer
  - **Characteristics**:
    - **Slow**
    - **Expensive**
    - **Not decisive**
    - **Global Singleton**(one computer for entire planet now and forever)
    - **Unstoppable**
    - **Natively multi-user**
    - **Atomicity**
  - [Ethereum: the World Computer](https://www.youtube.com/watch?v=j23HnORQXvs)
  - ["Ethereum - The World's Computer" - Gavin Wood](https://www.youtube.com/watch?v=8OLAcUPHuW0)
- 🖥️ [Transaction-Based State machine](https://ethereum.org/en/developers/docs/evm/)
- 🔄 [Ethereum and Turing Completeness](https://mirror.xyz/skyf4ll.eth/l24iNVL6sZF7CYn-wgP1Un2tBhoBvSb3YKgW6IZPGt0)
- 💰 [Ether](https://ethereum.org/en/developers/docs/gas/)

## Ethereum Accounts

- **Address model**: Uses a 20-byte address for each account.
- **Two types of accounts**:
  - Externally Owned Accounts (EOAs): Controlled by private keys, like the MetaMask wallets installed by students. These accounts have no code.
  - Contract Accounts: Controlled by their contract code, activated upon receiving a message or transaction.
- **Account fields**:
  - Nonce: Counter to ensure each transaction is processed once.
  - Ether balance: Current balance of the account.
  - Contract code: If present, the code of the account.
  - Storage: Empty by default.

## What is smart contract?

- **Fundamental building blocks**: Essential component of Ethereum's application layer.
- **Term coined by Nick Szabo**:

  - 1994: Introduced the [concept](https://www.fon.hum.uva.nl/rob/Courses/InformationInSpeech/CDROM/Literature/LOTwinterschool2006/szabo.best.vwh.net/smart.contracts.html).
  - 1996: Explored potential [uses](https://www.fon.hum.uva.nl/rob/Courses/InformationInSpeech/CDROM/Literature/LOTwinterschool2006/szabo.best.vwh.net/smart_contracts_2.html).

- **Characteristics**:
  - **Immutable**: Once deployed, the code cannot change. ([bugs bite](https://medium.com/@solidity101/hacks-on-the-rise-over-1-19-billion-lost-in-2024-d1eec77e1169))
  - **Deterministic**: Execution outcome is consistent for everyone, given the same transaction context and blockchain state.
  - **Decentralized**: Operate on the decentralized network, meaning they are executed across multiple nodes, ensuring trustless and transparent operation without a central authority.

Watch Finematics explain smart contracts: [Watch here](https://www.youtube.com/watch?v=pWGLtjG-F5c)

# Section 2: Your first smart contract

###

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract HelloWorld {
    string public greet = "HelloWorld";

    function setGreet(string calldata newGreet) external {
        greet = newGreet;
    }
}
```

[Open in Remix](https://remix.ethereum.org/?#code=Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KcHJhZ21hIHNvbGlkaXR5IDAuOC4yNjsNCg0KY29udHJhY3QgSGVsbG9Xb3JsZCB7DQogICAgc3RyaW5nIHB1YmxpYyBncmVldCA9ICJIZWxsb1dvcmxkIjsNCg0KICAgIGZ1bmN0aW9uIHNldEdyZWV0KHN0cmluZyBjYWxsZGF0YSBuZXdHcmVldCkgZXh0ZXJuYWwgew0KICAgICAgICBncmVldCA9IG5ld0dyZWV0Ow0KICAgIH0NCn0&lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.26+commit.8a97fa7a.js)

---

## Welcome to Remix

- [Remix](http://remix.ethereum.org)

## Hello world

- [Solidity in 100s](https://www.youtube.com/watch?v=kdvVwGrV7ec)
- Versioning
- Take notes in your code!
- [What is a software license](https://snyk.io/learn/what-is-a-software-license/)
- SPDX License
- Contract Declaration
- Compiling

## Deploying your First Contract

- A testnet or mainnet
- Connecting Metamask
- [Find faucets here!](#faucets)
- See the faucets at the top of this README!
- Interacting with Deployed Contracts

<p align="right">(<a href="#table-of-contents">back to top</a>) ⬆️</p>

# Section 3: Solidity Syntax

## Basic Solidity: Types

- [Types & Declaring Variables](https://docs.soliditylang.org/en/v0.8.26/)
  - `uint256`, `int256`, `bool`, `string`, `address`, `bytes32`
  - [Solidity Types](https://docs.soliditylang.org/en/latest/types.html)
  - [Bits and Bytes](https://www.youtube.com/watch?v=Dnd28lQHquU)
- Default Initializations
- Comments

## Basic Solidity: Function

- [Visibility](https://docs.soliditylang.org/en/latest/contracts.html#visibility-and-getters)
- [Function Selector](https://www.evm-function-selector.click)
- View & Pure Functions

## Immutable & Constant

## Basic Solidity: Arrays & Structs

- [Structs](https://docs.soliditylang.org/en/latest/structure-of-a-contract.html#struct-types)
- Intro to Storage
- Arrays
- [Dynamic & Fixed Sized](https://docs.soliditylang.org/en/latest/types.html#arrays)
- `push` array function

## Basic Solidity: Compiler Errors and Warnings

- Yellow: Warnings are Ok
- Red: Errors are not Ok

## Basic Solidity: Memory, Storage, Calldata (Intro)

- 6 Places you can store and access data
  - calldata
  - memory
  - storage
  - code
  - logs
  - stack

## Basic Solidity: Modifiers

- [Modifiers](https://docs.soliditylang.org/en/latest/contracts.html#function-modifiers)

## Basic Solidity: Error handling

- [Errors](https://docs.soliditylang.org/en/latest/abi-spec.html#errors)
- [`require`](https://docs.soliditylang.org/en/latest/control-structures.html#panic-via-assert-and-error-via-require)
- `assert`

## Receiving ETH through a function

- [Special functions](https://docs.soliditylang.org/en/latest/contracts.html#special-functions)
- [`fallback`](https://solidity-by-example.org/fallback/)
- [`receive`](https://docs.soliditylang.org/en/latest/contracts.html#receive-ether-function)

## Sending ETH through a function

- Transfer, Send, and Call
- `payable`

## Factory Pattern

- [Factory Pattern](https://betterprogramming.pub/learn-solidity-the-factory-pattern-75d11c3e7d29)

## Basic Solidity: Importing Contracts into other Contracts

- [Composibility](https://chain.link/techtalks/defi-composability)
- [Solidity new keyword](https://docs.soliditylang.org/en/latest/control-structures.html?highlight=new#creating-contracts-via-new)
- [Importing Code in solidity](https://solidity-by-example.org/import)

## Basic Solidity: Interacting with other Contracts

- To interact, you always need: ABI + Address
- [ABI](https://docs.soliditylang.org/en/latest/abi-spec.html?highlight=abi)

## Basic Solidity: Inheritance & Overrides

- [Inheritance](https://solidity-by-example.org/inheritance)
- [Override & Virtual Keyword](https://docs.soliditylang.org/en/latest/contracts.html?highlight=override#function-overriding)

# Section 4: Task

## Description

This section provides an overview of the tasks you need to complete. For a detailed description, please refer to the [TASK.md](./task/TASK.md) file.

## Solutions

Coming soon.