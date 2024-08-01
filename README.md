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

<details>
  <summary><a href="#section-4-vending-machine-factory">Section 4: Vending Machine Factory</a></summary>
  <ol>
    <li><a href="#introduction">Introduction</a></li>
    <li><a href="#basic-solidity-importing-contracts-into-other-contracts">Basic Solidity: Importing Contracts into other Contracts</a></li>
    <li><a href="#basic-solidity-interacting-with-other-contracts">Basic Solidity: Interacting with other Contracts</a></li>
    <li><a href="#basic-solidity-inheritance--overrides">Basic Solidity: Inheritance &amp; Overrides</a></li>
    <li><a href="#recap">Recap</a></li>
  </ol>
</details>

<hr style="border: 1px dashed #ccc;">
<p style="text-align: right; font-weight: bold;">⬇️ Day 2 ⬇️</p>

<details>
  <summary><a href="#section-5-introduction-to-defi">Section 5: Introduction to DeFi</a></summary>
  <ol>
    <li><a href="#what-is-defi">What is DeFi?</a></li>
    <li>
      <a href="#dex-vs-cex">DEX vs CEX</a>
      <ol>
        <li><a href="#intro-to-amms">Intro to AMMs</a></li>
        <li><a href="#uniswap">Uniswap</a></li>
      </ol>
    </li>
  </ol>
</details>

<details>
  <summary><a href="#section-6-uniswap-v1-introduction">Section 6: Uniswap V1 Introduction</a></summary>
  <ol>
    <li><a href="#what-is-erc20">What is ERC20?</a></li>
    <li>
      <a href="#coding-first-erc20">Coding first ERC20</a>
      <ol>
        <li><a href="#openzeppelin">OpenZeppelin</a></li>
      </ol>
    </li>
  </ol>
</details>

<details>
  <summary><a href="#section-7-uniswapv1-exchange-contract">Section 7: UniswapV1 Exchange Contract</a></summary>
</details>

<details>
  <summary><a href="#section-8-uniswapv1-factory-contract">Section 8: UniswapV1 Factory Contract</a></summary>
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
  - [Ethereum: the World Computer]((https://www.youtube.com/watch?v=j23HnORQXvs))
  - ["Ethereum - The World's Computer" - Gavin Wood](https://www.youtube.com/watch?v=8OLAcUPHuW0)
- 🖥️ [State machine](https://ethereum.org/en/developers/docs/evm/)
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
  - **Immutable**: Once deployed, the code cannot change.
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

# Section 3: Vending machine contract

### 
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract VendingMachine {
    enum Status {
        ACTIVE,
        PAUSED
    }

    struct Item {
        string name;
        uint256 supply;
        uint256 price;
    }

    uint256 constant MAX_ITEMS = 50;
    address public immutable owner;

    Status public status;

    uint256 index;

    uint256 totalBalance;
    uint256 totalItemsSold;

    mapping(uint256 => Item) public items;

    /*//////////////////////////////////////////////////////////////
                                 EVENTS
    //////////////////////////////////////////////////////////////*/
    event ItemAdded(uint256 itemId, Item item);
    event ItemReplaced(uint256 itemId, Item item);
    event StockUpdated(uint256 itemId, uint256 supply);
    event PriceSet(uint256 itemId, uint256 price);
    event Paused();
    event Unpaused();
    event ItemPurchased(uint256 itemId, uint256 price);
    event MoneyWithdrawn(uint256 amount);
    /*//////////////////////////////////////////////////////////////
                             CUSTOM ERRORS
    //////////////////////////////////////////////////////////////*/
    error VendingMachine__Unauthorized();
    error VendingMachine__MaxItemsReached();
    error VendingMachine__ItemAlreadyExist();
    error VendingMachine__ItemDoesNotExist();
    error VendingMachine__PriceIsZero();
    error VendingMachine__SupplyIsZero();
    error VendingMachine__SupplyIsNotEnough();
    error VendingMachine__PriceIsNotEnough();
    error VendingMachine__MachineIsPaused();
    error VendingMachine__NoMoneyToWithdraw();

    /*//////////////////////////////////////////////////////////////
                               MODIFIERS
    //////////////////////////////////////////////////////////////*/
    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert VendingMachine__Unauthorized();
        }
        _;
    }

    constructor() {
        owner = msg.sender;
    }
    /*//////////////////////////////////////////////////////////////
                           EXTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/
    function addItem(Item memory item) external onlyOwner {
        uint256 currentId = index;

        if (currentId > MAX_ITEMS) {
            revert VendingMachine__MaxItemsReached();
        }

        items[currentId] = item;
        index = currentId + 1;

        emit ItemAdded(currentId, item);
    }

    function replaceItem(uint256 itemId, Item memory item) external onlyOwner {
        _validateInput(itemId, item);

        items[itemId] = item;

        emit ItemReplaced(itemId, item);
    }

    function updateStock(uint256 itemId, uint256 supply) external onlyOwner {
        if (supply == 0) {
            revert VendingMachine__SupplyIsZero();
        }
        if (items[itemId].price == 0) {
            revert VendingMachine__ItemDoesNotExist();
        }

        items[itemId].supply += supply;

        emit StockUpdated(itemId, supply);
    }

    function setPrice(uint256 itemId, uint256 price) external onlyOwner {
        if (price == 0) {
            revert VendingMachine__PriceIsZero();
        }
        if (items[itemId].price == 0) {
            revert VendingMachine__ItemDoesNotExist();
        }

        items[itemId].price = price;

        emit PriceSet(itemId, price);
    }

    function pause() external onlyOwner {
        status = Status.PAUSED;

        emit Paused();
    }

    function unpause() external onlyOwner {
        status = Status.ACTIVE;

        emit Unpaused();
    }

    function purchaseItem(uint256 itemId, uint256 quantity) external payable {
        // First, let's check if machine is paused
        if (status == Status.PAUSED) {
            revert VendingMachine__MachineIsPaused();
        }
        Item memory item = items[itemId];
        // Second, let's check if item exist
        if (item.price == 0) {
            revert VendingMachine__ItemDoesNotExist();
        }
        // Third, let's check if price is enough
        if (msg.value < item.price * quantity) {
            revert VendingMachine__PriceIsNotEnough();
        }
        // Fourth, let's check if there is enough stock
        if (item.supply < quantity) {
            revert VendingMachine__SupplyIsNotEnough();
        }

        // Fifth, let's transfer the money
        totalBalance += items[itemId].price;
        // Sixth, let's update the stock
        items[itemId].supply -= quantity;
        // Seventh, let's update the total items sold
        totalItemsSold += quantity;
        // Eighth, let's emit the event
        emit ItemPurchased(itemId, item.price);
    }

    function withdrawMoney() external onlyOwner {
        uint256 totalToWithdraw = address(this).balance;
        if (totalToWithdraw == 0) {
            revert VendingMachine__NoMoneyToWithdraw();
        }

        (bool sent /*bytes memory data*/, ) = owner.call{
            value: totalToWithdraw
        }("");
        if (!sent) {
            revert();
        }
        emit MoneyWithdrawn(totalToWithdraw);
    }
    /*//////////////////////////////////////////////////////////////
                           INTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/
    function _validateInput(uint256 itemId, Item memory item) internal view {
        // Validate if item already exist
        if (items[itemId].price == 0) {
            revert VendingMachine__ItemDoesNotExist();
        }
        // Validate if price is zero
        if (item.price == 0) {
            revert VendingMachine__PriceIsZero();
        }
        // Validate if supply is zero
        if (item.supply == 0) {
            revert VendingMachine__SupplyIsZero();
        }
    }
}
```
[Open in Remix](https://remix.ethereum.org/?#code=Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KcHJhZ21hIHNvbGlkaXR5IDAuOC4yNjsNCg0KY29udHJhY3QgVmVuZGluZ01hY2hpbmUgew0KICAgIGVudW0gU3RhdHVzIHsNCiAgICAgICAgQUNUSVZFLA0KICAgICAgICBQQVVTRUQNCiAgICB9DQoNCiAgICBzdHJ1Y3QgSXRlbSB7DQogICAgICAgIHN0cmluZyBuYW1lOw0KICAgICAgICB1aW50MjU2IHN1cHBseTsNCiAgICAgICAgdWludDI1NiBwcmljZTsNCiAgICB9DQoNCiAgICB1aW50MjU2IGNvbnN0YW50IE1BWF9JVEVNUyA9IDUwOw0KICAgIGFkZHJlc3MgcHVibGljIGltbXV0YWJsZSBvd25lcjsNCg0KICAgIFN0YXR1cyBwdWJsaWMgc3RhdHVzOw0KDQogICAgdWludDI1NiBpbmRleDsNCg0KICAgIHVpbnQyNTYgdG90YWxCYWxhbmNlOw0KICAgIHVpbnQyNTYgdG90YWxJdGVtc1NvbGQ7DQoNCiAgICBtYXBwaW5nKHVpbnQyNTYgPT4gSXRlbSkgcHVibGljIGl0ZW1zOw0KDQogICAgLyovLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRVZFTlRTDQogICAgLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8qLw0KICAgIGV2ZW50IEl0ZW1BZGRlZCh1aW50MjU2IGl0ZW1JZCwgSXRlbSBpdGVtKTsNCiAgICBldmVudCBJdGVtUmVwbGFjZWQodWludDI1NiBpdGVtSWQsIEl0ZW0gaXRlbSk7DQogICAgZXZlbnQgU3RvY2tVcGRhdGVkKHVpbnQyNTYgaXRlbUlkLCB1aW50MjU2IHN1cHBseSk7DQogICAgZXZlbnQgUHJpY2VTZXQodWludDI1NiBpdGVtSWQsIHVpbnQyNTYgcHJpY2UpOw0KICAgIGV2ZW50IFBhdXNlZCgpOw0KICAgIGV2ZW50IFVucGF1c2VkKCk7DQogICAgZXZlbnQgSXRlbVB1cmNoYXNlZCh1aW50MjU2IGl0ZW1JZCwgdWludDI1NiBwcmljZSk7DQogICAgZXZlbnQgTW9uZXlXaXRoZHJhd24odWludDI1NiBhbW91bnQpOw0KICAgIC8qLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8NCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1VTVE9NIEVSUk9SUw0KICAgIC8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vKi8NCiAgICBlcnJvciBWZW5kaW5nTWFjaGluZV9fVW5hdXRob3JpemVkKCk7DQogICAgZXJyb3IgVmVuZGluZ01hY2hpbmVfX01heEl0ZW1zUmVhY2hlZCgpOw0KICAgIGVycm9yIFZlbmRpbmdNYWNoaW5lX19JdGVtQWxyZWFkeUV4aXN0KCk7DQogICAgZXJyb3IgVmVuZGluZ01hY2hpbmVfX0l0ZW1Eb2VzTm90RXhpc3QoKTsNCiAgICBlcnJvciBWZW5kaW5nTWFjaGluZV9fUHJpY2VJc1plcm8oKTsNCiAgICBlcnJvciBWZW5kaW5nTWFjaGluZV9fU3VwcGx5SXNaZXJvKCk7DQogICAgZXJyb3IgVmVuZGluZ01hY2hpbmVfX1N1cHBseUlzTm90RW5vdWdoKCk7DQogICAgZXJyb3IgVmVuZGluZ01hY2hpbmVfX1ByaWNlSXNOb3RFbm91Z2goKTsNCiAgICBlcnJvciBWZW5kaW5nTWFjaGluZV9fTWFjaGluZUlzUGF1c2VkKCk7DQogICAgZXJyb3IgVmVuZGluZ01hY2hpbmVfX05vTW9uZXlUb1dpdGhkcmF3KCk7DQoNCiAgICAvKi8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTU9ESUZJRVJTDQogICAgLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8qLw0KICAgIG1vZGlmaWVyIG9ubHlPd25lcigpIHsNCiAgICAgICAgaWYgKG1zZy5zZW5kZXIgIT0gb3duZXIpIHsNCiAgICAgICAgICAgIHJldmVydCBWZW5kaW5nTWFjaGluZV9fVW5hdXRob3JpemVkKCk7DQogICAgICAgIH0NCiAgICAgICAgXzsNCiAgICB9DQoNCiAgICBjb25zdHJ1Y3RvcigpIHsNCiAgICAgICAgb3duZXIgPSBtc2cuc2VuZGVyOw0KICAgIH0NCiAgICAvKi8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vDQogICAgICAgICAgICAgICAgICAgICAgICAgICBFWFRFUk5BTCBGVU5DVElPTlMNCiAgICAvLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLyovDQogICAgZnVuY3Rpb24gYWRkSXRlbShJdGVtIG1lbW9yeSBpdGVtKSBleHRlcm5hbCBvbmx5T3duZXIgew0KICAgICAgICB1aW50MjU2IGN1cnJlbnRJZCA9IGluZGV4Ow0KDQogICAgICAgIGlmIChjdXJyZW50SWQgPiBNQVhfSVRFTVMpIHsNCiAgICAgICAgICAgIHJldmVydCBWZW5kaW5nTWFjaGluZV9fTWF4SXRlbXNSZWFjaGVkKCk7DQogICAgICAgIH0NCg0KICAgICAgICBpdGVtc1tjdXJyZW50SWRdID0gaXRlbTsNCiAgICAgICAgaW5kZXggPSBjdXJyZW50SWQgKyAxOw0KDQogICAgICAgIGVtaXQgSXRlbUFkZGVkKGN1cnJlbnRJZCwgaXRlbSk7DQogICAgfQ0KDQogICAgZnVuY3Rpb24gcmVwbGFjZUl0ZW0odWludDI1NiBpdGVtSWQsIEl0ZW0gbWVtb3J5IGl0ZW0pIGV4dGVybmFsIG9ubHlPd25lciB7DQogICAgICAgIF92YWxpZGF0ZUlucHV0KGl0ZW1JZCwgaXRlbSk7DQoNCiAgICAgICAgaXRlbXNbaXRlbUlkXSA9IGl0ZW07DQoNCiAgICAgICAgZW1pdCBJdGVtUmVwbGFjZWQoaXRlbUlkLCBpdGVtKTsNCiAgICB9DQoNCiAgICBmdW5jdGlvbiB1cGRhdGVTdG9jayh1aW50MjU2IGl0ZW1JZCwgdWludDI1NiBzdXBwbHkpIGV4dGVybmFsIG9ubHlPd25lciB7DQogICAgICAgIGlmIChzdXBwbHkgPT0gMCkgew0KICAgICAgICAgICAgcmV2ZXJ0IFZlbmRpbmdNYWNoaW5lX19TdXBwbHlJc1plcm8oKTsNCiAgICAgICAgfQ0KICAgICAgICBpZiAoaXRlbXNbaXRlbUlkXS5wcmljZSA9PSAwKSB7DQogICAgICAgICAgICByZXZlcnQgVmVuZGluZ01hY2hpbmVfX0l0ZW1Eb2VzTm90RXhpc3QoKTsNCiAgICAgICAgfQ0KDQogICAgICAgIGl0ZW1zW2l0ZW1JZF0uc3VwcGx5ICs9IHN1cHBseTsNCg0KICAgICAgICBlbWl0IFN0b2NrVXBkYXRlZChpdGVtSWQsIHN1cHBseSk7DQogICAgfQ0KDQogICAgZnVuY3Rpb24gc2V0UHJpY2UodWludDI1NiBpdGVtSWQsIHVpbnQyNTYgcHJpY2UpIGV4dGVybmFsIG9ubHlPd25lciB7DQogICAgICAgIGlmIChwcmljZSA9PSAwKSB7DQogICAgICAgICAgICByZXZlcnQgVmVuZGluZ01hY2hpbmVfX1ByaWNlSXNaZXJvKCk7DQogICAgICAgIH0NCiAgICAgICAgaWYgKGl0ZW1zW2l0ZW1JZF0ucHJpY2UgPT0gMCkgew0KICAgICAgICAgICAgcmV2ZXJ0IFZlbmRpbmdNYWNoaW5lX19JdGVtRG9lc05vdEV4aXN0KCk7DQogICAgICAgIH0NCg0KICAgICAgICBpdGVtc1tpdGVtSWRdLnByaWNlID0gcHJpY2U7DQoNCiAgICAgICAgZW1pdCBQcmljZVNldChpdGVtSWQsIHByaWNlKTsNCiAgICB9DQoNCiAgICBmdW5jdGlvbiBwYXVzZSgpIGV4dGVybmFsIG9ubHlPd25lciB7DQogICAgICAgIHN0YXR1cyA9IFN0YXR1cy5QQVVTRUQ7DQoNCiAgICAgICAgZW1pdCBQYXVzZWQoKTsNCiAgICB9DQoNCiAgICBmdW5jdGlvbiB1bnBhdXNlKCkgZXh0ZXJuYWwgb25seU93bmVyIHsNCiAgICAgICAgc3RhdHVzID0gU3RhdHVzLkFDVElWRTsNCg0KICAgICAgICBlbWl0IFVucGF1c2VkKCk7DQogICAgfQ0KDQogICAgZnVuY3Rpb24gcHVyY2hhc2VJdGVtKHVpbnQyNTYgaXRlbUlkLCB1aW50MjU2IHF1YW50aXR5KSBleHRlcm5hbCBwYXlhYmxlIHsNCiAgICAgICAgLy8gRmlyc3QsIGxldCdzIGNoZWNrIGlmIG1hY2hpbmUgaXMgcGF1c2VkDQogICAgICAgIGlmIChzdGF0dXMgPT0gU3RhdHVzLlBBVVNFRCkgew0KICAgICAgICAgICAgcmV2ZXJ0IFZlbmRpbmdNYWNoaW5lX19NYWNoaW5lSXNQYXVzZWQoKTsNCiAgICAgICAgfQ0KICAgICAgICBJdGVtIG1lbW9yeSBpdGVtID0gaXRlbXNbaXRlbUlkXTsNCiAgICAgICAgLy8gU2Vjb25kLCBsZXQncyBjaGVjayBpZiBpdGVtIGV4aXN0DQogICAgICAgIGlmIChpdGVtLnByaWNlID09IDApIHsNCiAgICAgICAgICAgIHJldmVydCBWZW5kaW5nTWFjaGluZV9fSXRlbURvZXNOb3RFeGlzdCgpOw0KICAgICAgICB9DQogICAgICAgIC8vIFRoaXJkLCBsZXQncyBjaGVjayBpZiBwcmljZSBpcyBlbm91Z2gNCiAgICAgICAgaWYgKG1zZy52YWx1ZSA8IGl0ZW0ucHJpY2UgKiBxdWFudGl0eSkgew0KICAgICAgICAgICAgcmV2ZXJ0IFZlbmRpbmdNYWNoaW5lX19QcmljZUlzTm90RW5vdWdoKCk7DQogICAgICAgIH0NCiAgICAgICAgLy8gRm91cnRoLCBsZXQncyBjaGVjayBpZiB0aGVyZSBpcyBlbm91Z2ggc3RvY2sNCiAgICAgICAgaWYgKGl0ZW0uc3VwcGx5IDwgcXVhbnRpdHkpIHsNCiAgICAgICAgICAgIHJldmVydCBWZW5kaW5nTWFjaGluZV9fU3VwcGx5SXNOb3RFbm91Z2goKTsNCiAgICAgICAgfQ0KDQogICAgICAgIC8vIEZpZnRoLCBsZXQncyB0cmFuc2ZlciB0aGUgbW9uZXkNCiAgICAgICAgdG90YWxCYWxhbmNlICs9IGl0ZW1zW2l0ZW1JZF0ucHJpY2U7DQogICAgICAgIC8vIFNpeHRoLCBsZXQncyB1cGRhdGUgdGhlIHN0b2NrDQogICAgICAgIGl0ZW1zW2l0ZW1JZF0uc3VwcGx5IC09IHF1YW50aXR5Ow0KICAgICAgICAvLyBTZXZlbnRoLCBsZXQncyB1cGRhdGUgdGhlIHRvdGFsIGl0ZW1zIHNvbGQNCiAgICAgICAgdG90YWxJdGVtc1NvbGQgKz0gcXVhbnRpdHk7DQogICAgICAgIC8vIEVpZ2h0aCwgbGV0J3MgZW1pdCB0aGUgZXZlbnQNCiAgICAgICAgZW1pdCBJdGVtUHVyY2hhc2VkKGl0ZW1JZCwgaXRlbS5wcmljZSk7DQogICAgfQ0KDQogICAgZnVuY3Rpb24gd2l0aGRyYXdNb25leSgpIGV4dGVybmFsIG9ubHlPd25lciB7DQogICAgICAgIHVpbnQyNTYgdG90YWxUb1dpdGhkcmF3ID0gYWRkcmVzcyh0aGlzKS5iYWxhbmNlOw0KICAgICAgICBpZiAodG90YWxUb1dpdGhkcmF3ID09IDApIHsNCiAgICAgICAgICAgIHJldmVydCBWZW5kaW5nTWFjaGluZV9fTm9Nb25leVRvV2l0aGRyYXcoKTsNCiAgICAgICAgfQ0KDQogICAgICAgIChib29sIHNlbnQgLypieXRlcyBtZW1vcnkgZGF0YSovLCApID0gb3duZXIuY2FsbHsNCiAgICAgICAgICAgIHZhbHVlOiB0b3RhbFRvV2l0aGRyYXcNCiAgICAgICAgfSgiIik7DQogICAgICAgIGlmICghc2VudCkgew0KICAgICAgICAgICAgcmV2ZXJ0KCk7DQogICAgICAgIH0NCiAgICAgICAgZW1pdCBNb25leVdpdGhkcmF3bih0b3RhbFRvV2l0aGRyYXcpOw0KICAgIH0NCiAgICAvKi8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vDQogICAgICAgICAgICAgICAgICAgICAgICAgICBJTlRFUk5BTCBGVU5DVElPTlMNCiAgICAvLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8vLyovDQogICAgZnVuY3Rpb24gX3ZhbGlkYXRlSW5wdXQodWludDI1NiBpdGVtSWQsIEl0ZW0gbWVtb3J5IGl0ZW0pIGludGVybmFsIHZpZXcgew0KICAgICAgICAvLyBWYWxpZGF0ZSBpZiBpdGVtIGFscmVhZHkgZXhpc3QNCiAgICAgICAgaWYgKGl0ZW1zW2l0ZW1JZF0ucHJpY2UgPT0gMCkgew0KICAgICAgICAgICAgcmV2ZXJ0IFZlbmRpbmdNYWNoaW5lX19JdGVtRG9lc05vdEV4aXN0KCk7DQogICAgICAgIH0NCiAgICAgICAgLy8gVmFsaWRhdGUgaWYgcHJpY2UgaXMgemVybw0KICAgICAgICBpZiAoaXRlbS5wcmljZSA9PSAwKSB7DQogICAgICAgICAgICByZXZlcnQgVmVuZGluZ01hY2hpbmVfX1ByaWNlSXNaZXJvKCk7DQogICAgICAgIH0NCiAgICAgICAgLy8gVmFsaWRhdGUgaWYgc3VwcGx5IGlzIHplcm8NCiAgICAgICAgaWYgKGl0ZW0uc3VwcGx5ID09IDApIHsNCiAgICAgICAgICAgIHJldmVydCBWZW5kaW5nTWFjaGluZV9fU3VwcGx5SXNaZXJvKCk7DQogICAgICAgIH0NCiAgICB9DQp9&lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.26+commit.8a97fa7a.js)

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
- [`falback`](https://solidity-by-example.org/fallback/)
- [`receive`](https://docs.soliditylang.org/en/latest/contracts.html#receive-ether-function)



## Sending ETH through a function

- Transfer, Send, and Call
- `payable`

## Improved vending machine

Gas matters :)

### Storage

- Layout
- Struct packing

# Section 4: Vending machine factory

## Introduction

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

## Recap

# Section 5: Introduction to DeFi

## What is DeFi?

Watch finematic video..

## DEX vs CEX

- Intro to AMMs
- Uniswap

# Section 6: Uniswap V1 introduction

## What is ERC20?
- What is EIP?

## Coding first ERC20

- OpenZeppelin

# Section 7: UniswapV1 Exchange contract

# Section 8: UniswapV1 Factory contract
