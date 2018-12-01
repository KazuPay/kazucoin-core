What is Kazucoin?
----------------

Kazucoin (KAZU) is a rapidly growing four year old decentralized global blockchain with a focus on cyber security, payments & secure communications technologies.

For more information, as well as an immediately useable, binary version of
the Kazucoin Core software, see https://kazucoin.io

Kazucoin FAQ
-------------
Launch Date: May 21, 2018

Blockchain Type: Public, Decentralized, UTXO based, Multi-Algorithm

Ticker Symbol: KAZU

Genesis Block Hash: "No Power Whole Day"

Max Total Supply: ~28 Million Kazucoins in 21 Years (2035)

Current Supply: 10.7M KAZU (Dec 2018)

Block Reward Reduction: 0.5% Monthly After block 125,000

Current Block Reward 50 KAZU

Mining Algorithms: Five (Sha256, Scrypt, Groestl, Skein & Qubit)

Block Timing: 2.5 Minute Blocks, (15 Minutes per algo)

Algo Block Share: 20% Block Share Per Algo (5)

Difficulty Retarget Every 1 Block, 5 Separate Difficulties, 1 For Each Mining Algo

SegWit Support Yes. Will activate Segwit at block 125,000. 

You can mine Kazucoin on one of five separate mining algorithms. Each algo averages out to mine 20% of new blocks. This allows for much greater decentralization than other blockchains. In order for an attacker to hardfork Kazucoin the attacker would need to control 93% of the hashrate on 1 algo, and 51% of the other 4 making Kazucoin much more secure against PoW attacks than other blockchains.

Kazucoin vs Bitcoin
-------------------

Security: 5 Kazucoin mining algorithms vs. 1 Bitcoin algorithm.
Kazucoin mining is much more decentralized.
Kazucoin mining algorithms can be changed out in the future to prevent centralization.

Speed:  Kazucoin transactions occur much faster than Bitcoin transactions.
1-3 second transaction notifications.
2.5 minute Kazucoin blocks vs. 10 minute Bitcoin blocks.
Kazucoins are confirmed after 10 minutes vs. 1 hour with Bitcoin.

Transaction Volume: Kazucoin can handle many more transactions per second.
Bitcoin can only handle 3-4 transactions per second.
Kazucoin currently can handle 280+ transactions per second.

Flexibility: Ability to quickly add new features.
Kazucoin can add new features & upgrades much quicker than Bitcoin.
Future Kazucoin upgrades will push transaction limit to several thousand per second.

Marketability & Usability: Kazucoin is an easy brand to market to consumers.
Kazucoins are much cheaper to acquire.

License
-------

Kazucoin Core is released under the terms of the MIT license. See [COPYING](COPYING) for more
information or see https://opensource.org/licenses/MIT.

Development Process
-------------------

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/kazucoin/kazucoin/tags) are created
regularly to indicate new official, stable release versions of Kazucoin Core.

The contribution workflow is described in [CONTRIBUTING.md](CONTRIBUTING.md).

Testing
-------

### Automated Testing

Developers are strongly encouraged to write [unit tests](src/test/README.md) for new code, and to
submit new unit tests for old code. Unit tests can be compiled and run
(assuming they weren't disabled in configure) with: `make check`. Further details on running
and extending unit tests can be found in [/src/test/README.md](/src/test/README.md).

There are also [regression and integration tests](/test), written
in Python, that are run automatically on the build server.
These tests can be run (if the [test dependencies](/test) are installed) with: `test/functional/test_runner.py`

The Travis CI system makes sure that every pull request is built for Windows, Linux, and macOS, and that unit/sanity tests are run automatically.

### Manual Quality Assurance (QA) Testing

Changes should be tested by somebody other than the developer who wrote the
code. This is especially important for large or high-risk changes. It is useful
to add a test plan to the pull request description if testing the changes is
not straightforward.


