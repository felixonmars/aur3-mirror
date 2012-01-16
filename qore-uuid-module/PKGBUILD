# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Boris Shomodjvarac <shomodj@gmail.com>
pkgname=qore-uuid-module
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="The Qore uuid module provides the ability to generate and parse UUIDs, Universally Unique Identifiers."
arch=("i686" "x86_64")
url="http://www.qore.org/"
license=('GPL2', "LGPL2")
groups=()
depends=("")
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
source=("http://sourceforge.net/projects/qore/files/module-uuid/1.1/qore-uuid-module-1.1.tar.gz" "configure.patch")
noextract=()

md5sums=('1376f7bbc12818e9cecb88520e16729b'
         'bb68f1ab9532a19ed50bb88ddd7a9dc3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  _CONFIGURE_OPTS="--prefix=/usr --disable-static --disable-debug"
  [ "$CARCH" = "x86_64" ] && _CONFIGURE_OPTS="$_CONFIGURE_OPTS --enable-64bit"

  cp ../../configure.patch .
  patch < configure.patch

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
