# Solidity — Alchemy University (Learn Solidity Course)

Individual contribution to the **Blockchain Group Project (10%)** by:

- **Name:** Abel Getahun
- **ID:** UGR/30057/15
- **Course completed:** [Alchemy University — Learn Solidity](https://www.alchemy.com/university/courses/solidity)

This folder contains every exercise solved during the four chapters of the course, along with the official test files (`*.t.sol`) used by Alchemy's in-browser Foundry runner to grade each lesson.

> Course completion proof: see [`course completion.png`](./course%20completion.png) at the root of this folder.

---

## Folder structure

```
solidity-alchemy-course__Abel-Getahun_UGR-30057-15/
├── chapter1/                     # Solidity Basics
│   ├── basic-data-types/         # booleans, uints, ints, strings, enums
│   └── functions/                # arguments, view, pure, console.log, overloading
├── chapter2/                     # Contracts, Ether & Calldata
│   ├── 1_sending-ether/          # owner, receive, tip, charity, selfdestruct
│   ├── 2_reverting-transactions/ # require/revert, custom errors, modifiers
│   ├── 3_practice-calldata/      # abi.encode / encodeWithSignature, fallback
│   └── 4_escrow/                 # mini Escrow project (setup → events)
├── chapter3/                     # Reference Types
│   ├── 1_arrays/                 # fixed/dynamic, filter, StackClub
│   ├── 2_structs/                # voting structs (storage / memory)
│   └── 3_mappings/               # add/remove member, struct maps, nested maps
├── chapter4/                     # Advanced Solidity
│   ├── 1_voting/                 # full DAO-style voting contract (6 stages)
│   └── 2_inheritance/            # virtual/override, super, Ownable, multiple inheritance
└── course completion.png         # Screenshot of finished course
```

Each lesson sits in its own numbered folder and ships with:

- `Contract.sol` (or `Escrow.sol` / `Voting.sol` / `StackClub.sol` / `Hero.sol` / etc.) — the implementation.
- `Contract.t.sol` — the Foundry test that the lesson must pass.
- `Screenshot ....png` — proof that the lesson's tests passed in Alchemy's runner.

The single exception is `chapter1/functions/4_console-log/`, which has no test file because the lesson is a `console.log` demo (the screenshot still shows the expected log output).

---

## Running the tests locally (Foundry)

The course uses [Foundry](https://book.getfoundry.sh/) under the hood. To run any single lesson locally:

```bash
# install foundry once
curl -L https://foundry.paradigm.xyz | bash
foundryup

# from the lesson folder, e.g.
cd chapter4/1_voting/6_execute
forge test -vv
```

Every contract targets `pragma solidity ^0.8.20` (or `0.8.20`).

---

## What was learned

| Chapter | Key concepts                                                                 |
| ------- | --------------------------------------------------------------------------- |
| 1       | Value types, visibility, `view` / `pure`, function overloading, `console.log` |
| 2       | `payable`, `receive` / `fallback`, `require` / `revert`, custom errors, low-level `call`, `selfdestruct` |
| 3       | Fixed & dynamic arrays, `memory` vs `storage`, structs, mappings, nested mappings |
| 4       | Building a small DAO (proposals, votes, execution), inheritance, `virtual`, `override`, `super`, `Ownable` pattern, multiple inheritance |

---

## Course completion proof

![Course completion](./course%20completion.png)
