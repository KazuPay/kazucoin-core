macOS Build Instructions and Notes
====================================
The commands in this guide should be executed in a Terminal application.
The built-in one is located in `/Applications/Utilities/Terminal.app`.

Preparation
-----------
Install the macOS command line tools:

`xcode-select --install`

When the popup appears, click `Install`.

Then install [Homebrew](https://brew.sh).

Dependencies
----------------------

    brew install automake berkeley-db4 libtool boost miniupnpc openssl pkg-config protobuf python qt libevent qrencode

See [dependencies.md](dependencies.md) for a complete overview.

If you want to build the disk image with `make deploy` (.dmg / optional), you need RSVG

    brew install librsvg

Install Kazucoin Core
------------------------

Clone the Kazucoin Core source code and cd into `kazucoin-core`

        git clone https://github.com/kazucoin/kazucoin-core
        cd kazucoin-core

Berkeley DB
-----------
It is recommended to use Berkeley DB 4.8. If you have to build it yourself,
you can use [the installation script included in contrib/](/contrib/install_db4.sh)
like so

```shell
./contrib/install_db4.sh .
```

Boost
-----------
```
wget "https://sourceforge.net/projects/boost/files/boost/1.65.0/boost_1_65_0.tar.gz/download" -O boost_1_65_0.tar.gz
tar -xvzf boost_1_65_0.tar.gz

cd boost_1_65_0/
export BOOST_HAS_THREADS ON
export BOOST_HAS_PTHREADS ON
export Boost_USE_MULTITHREADED ON
./bootstrap.sh --prefix=/$(pwd)/../kazucoin-core/boostkazucoin 
./b2 install --prefix=/$(pwd)/../kazucoin-core/boostkazucoin --layout=tagged --threading=multi --without-mpi --build-type=complete
cd ..
mkdir contrib/Frameworks
cp boostkazucoin/lib/libboost_system-mt.dylib ./contrib/Frameworks/
```

from the root of the repository.

**Note**: You only need Berkeley DB if the wallet is enabled (see the section *Disable-Wallet mode* below).

Build Kazucoin Core
------------------------

1.  Build Kazucoin Core:

    Configure and build the headless Kazucoin Core binaries as well as the GUI (if Qt is found).

    You can disable the GUI build by passing `--without-gui` to configure.
    
    Be sure to install BDB and Boost from above

        export BDB_PREFIX='/$(pwd)/db4'
        export BOOST_ROOT='/$(pwd)/boostkazucoin'
        ./autogen.sh
        ./configure BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include" BOOST_LIBS="-L${BOOST_PREFIX}/lib" BOOST_CFLAGS="-I${BDB_PREFIX}/include"
        make

2.  It is recommended to build and run the unit tests:

        make check

3.  You can also create a .dmg that contains the .app bundle (optional):

        make deploy

Running
-------

Kazucoin Core is now available at `./src/kazucoind` & `./src/kazucoin-cli` & `./src/kazucoin-tx`

Before running, it's recommended that you create an RPC configuration file.

    echo -e "rpcuser=kazucoinrpc\nrpcpassword=$(xxd -l 16 -p /dev/urandom)" > "/Users/${USER}/Library/Application Support/Kazucoin/kazucoin.conf"

    chmod 600 "/Users/${USER}/Library/Application Support/Kazucoin/kazucoin.conf"

The first time you run kazucoind, it will start downloading the blockchain. This process could take several hours.

You can monitor the download process by looking at the debug.log file:

    tail -f $HOME/Library/Application\ Support/Kazucoin/debug.log

Other commands:
-------

    ./src/kazucoind -daemon # Starts the kazucoin daemon.
    ./src/kazucoin-cli --help # Outputs a list of command-line options.
    ./src/kazucoin-cli help # Outputs a list of RPC commands when the daemon is running.

Notes
-----

* Tested on OS X 10.10 Yosemite through macOS 10.13 High Sierra on 64-bit Intel processors only.

* Building with downloaded Qt binaries is not officially supported. See the notes in [#7714](https://github.com/kazucoin/kazucoin/issues/7714)
