#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

KAZUCOIND=${KAZUCOIND:-$SRCDIR/kazucoind}
KAZUCOINCLI=${KAZUCOINCLI:-$SRCDIR/kazucoin-cli}
KAZUCOINTX=${KAZUCOINTX:-$SRCDIR/kazucoin-tx}
KAZUCOINQT=${KAZUCOINQT:-$SRCDIR/qt/kazucoin-qt}

[ ! -x $KAZUCOIND ] && echo "$KAZUCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
KAZUVER=($($KAZUCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for kazucoind if --version-string is not set,
# but has different outcomes for kazucoin-qt and kazucoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$KAZUCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $KAZUCOIND $KAZUCOINCLI $KAZUCOINTX $KAZUCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${KAZUVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${KAZUVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
