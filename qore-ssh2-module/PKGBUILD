# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Boris Shomodjvarac <shomodj@gmail.com>
pkgname=qore-ssh2-module
pkgver=0.9.6
pkgrel=1
epoch=
pkgdesc="This module provides the ability for Qore programs to communicate via the ssh2 and sftp protocols using libssh2."
arch=("i686" "x86_64")
url="http://www.qore.org/"
license=('GPL2', "LGPL2")
groups=()
depends=("libssh2")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/qore/files/module-ssh2/0.9.6/qore-ssh2-module-0.9.6.tar.bz2" "configure.patch" "SSH2Client.h.patch")
noextract=()

md5sums=('59bdb781bc9aad378631ab19107a806b'
         'bb68f1ab9532a19ed50bb88ddd7a9dc3'
         'bf437b12988c8040542daebab9b4969e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  _CONFIGURE_OPTS="--prefix=/usr --disable-static --disable-debug"
  [ "$CARCH" = "x86_64" ] && _CONFIGURE_OPTS="$_CONFIGURE_OPTS --enable-64bit"

  cp ../../configure.patch .
  cp ../../SSH2Client.h.patch src/
  patch < configure.patch
  cd src && patch < SSH2Client.h.patch
  cd ..

  echo "./configure $_CONFIGURE_OPTS"
  ./configure $_CONFIGURE_OPTS
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
