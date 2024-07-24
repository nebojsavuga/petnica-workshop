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
<summary><a href="#section-2-your-first-smart-contract">Section 2: Your first smart contract!</a></summary>
<ol>
  <li><a href="#welcome-to-remix">Welcome to Remix</a></li>
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

Watch Finematics explain smart contracts: [Watch here](https://www.youtube.com/watch?v=pWGLtjG-F5c)

# Section 2: Your first smart contract

## Welcome to Remix
Hello world example, intro to bytecode, compilation, abi etc..
