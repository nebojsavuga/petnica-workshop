<div align="center">
<h1>Petnica Ethereum Workshop <br>| Edition 2024 |</h1>
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
  <summary><a href="#section-3-vending-machine-contract">Section 3: Vending Machine Contract</a></summary>
  <ol>
    <li><a href="#vending-machine-contract">Vending machine contract</a>
      <ol>
        <li><a href="#basic-solidity-types">Basic Solidity: Types</a></li>
        <li><a href="#basic-solidity-function">Basic Solidity: Function</a></li>
        <li><a href="#basic-solidity-arrays--structs">Basic Solidity: Arrays & Structs</a></li>
        <li><a href="#basic-solidity-compiler-errors-and-warnings">Basic Solidity: Compiler Errors and Warnings</a></li>
        <li><a href="#basic-solidity-memory-storage-calldata-intro">Basic Solidity: Memory, Storage, Calldata (Intro)</a></li>
        <li><a href="#basic-solidity-modifiers">Basic Solidity: Modifiers</a></li>
        <li><a href="#basic-solidity-custom-errors">Basic Solidity: Custom Errors</a></li>
        <li><a href="#receiving-eth-through-a-function">Receiving ETH through a function</a>
          <ol>
            <li><a href="#receive-fallback-functions">Receive & Fallback Functions</a></li>
            <li><a href="#immutable-constant">Immutable & Constant</a></li>
          </ol>
        </li>
        <li><a href="#sending-eth-through-a-function">Sending ETH through a function</a></li>
      </ol>
    </li>
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

Welcome to the Petnica Ethereum Workshop Edition 2024! In this workshop, we will explore the fundamentals of Ethereum, including the basics of smart contracts and how they work. You’ll gain practical insights into Ethereum’s core concepts and get hands-on experience by writing your first smart contracts.

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
- 🖥️ State machine
- 🔄 Ethereum and Turing Completeness
- 💰 Ether

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

  - 1994: Introduced the concept.
  - 1996: Explored potential uses.

- **Characteristics**:
  - **Immutable**: Once deployed, the code cannot change.
  - **Deterministic**: Execution outcome is consistent for everyone, given the same transaction context and blockchain state.
  - **Decentralized**: Operate on the decentralized network, meaning they are executed across multiple nodes, ensuring trustless and transparent operation without a central authority.

Watch Finematics explain smart contracts: [Watch here](https://www.youtube.com/watch?v=pWGLtjG-F5c)

# Section 2: Your first smart contract

### Add code here

---

## Welcome to Remix

- [Remix](http://remix.ethereum.org)

## Hello world

- Versioning
- Take notes in your code!
- [What is a software license](https://snyk.io/learn/what-is-a-software-license/)
- SPDX License
- Compiling
- Contract Declaration

## Deploying your First Contract

- A testnet or mainnet
- Connecting Metamask
- [Find faucets here!](#faucets)
- See the faucets at the top of this README!
- Interacting with Deployed Contracts

<p align="right">(<a href="#table-of-contents">back to top</a>) ⬆️</p>

# Section 3: Vending machine contract

### Add code here

---

## Basic Solidity: Types

- [Types & Declaring Variables](https://docs.soliditylang.org/en/v0.8.26/)
  - `uint256`, `int256`, `bool`, `string`, `address`, `bytes32`
  - [Solidity Types](https://docs.soliditylang.org/en/latest/types.html)
  - [Bits and Bytes](https://www.youtube.com/watch?v=Dnd28lQHquU)
- Default Initializations
- Comments

## Basic Solidity: Function

- [Visibility](https://docs.soliditylang.org/en/latest/contracts.html#visibility-and-getters)
- Function Selector
- View & Pure Functions

## Basic Solidity: Arrays & Structs

- Structs
- Intro to Storage
- Arrays
- Dynamic & Fixed Sized
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

## Basic Solidity: Custom errors

## Receiving ETH through a function

### Receive & Fallback Functions

### Immutable & Constant

## Sending ETH through a function
- Transfer, Send, and Call


