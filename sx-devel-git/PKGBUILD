# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=sx-devel-git
pkgver=20140529
pkgrel=1
pkgdesc="S(pesmilo)X(changer) modular Bitcoin cmdline utilities (development branch)"
arch=('i686' 'x86_64')
depends=('boost' 'czmq-git' 'czmqpp-git' 'libbitcoin-leveldb-devel-git' 'libsodium' 'libwallet-devel-git' 'ncurses' 'obelisk-devel-git' 'python2' 'python2-ecdsa' 'python2-pyzmq' 'qrencode')
makedepends=('autoconf' 'curl' 'gcc' 'git' 'libconfig' 'libtool' 'make' 'pkg-config')
optdepends=('zenity: for sx-gui')
url="https://github.com/spesmilo/sx"
license=('AGPL3')
source=(git+https://github.com/spesmilo/sx#branch=develop)
sha256sums=('SKIP')
provides=('sx')
conflicts=('sx')
install=sx.install

pkgver() {
  cd ${pkgname%-devel*}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-devel*}

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'

  msg 'Fixing tool: sx-gui.sh...'
  sed -i 's@^#!bin/sh@#!/bin/bash@' tools/sx-gui.sh
  chmod +x tools/sx-gui.sh
}

build() {
  cd ${pkgname%-devel*}

  msg 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/sx \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/sx \
    --localstatedir=/var/lib/sx \
    --with-ncurses
  make
}

package() {
  cd ${pkgname%-devel*}

  msg 'Installing license...'
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/sx/COPYING

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Installing tools...'
  install -dm 755 $pkgdir/usr/share/sx
  for _appdir in tools; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/sx/$_appdir
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
