
Debian
====================
This directory contains files used to package kazucoind/kazucoin-qt
for Debian-based Linux systems. If you compile kazucoind/kazucoin-qt yourself, there are some useful files here.

## kazucoin: URI support ##


kazucoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install kazucoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your kazucoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/kazucoin128.png` to `/usr/share/pixmaps`

kazucoin-qt.protocol (KDE)

