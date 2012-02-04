# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Boris Shomodjvarac <shomodj@gmail.com>
pkgname=qore-json-module
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="The Qore json module allows Qore programs to parse and generate JSON strings and use JSON-RPC functionality."
arch=("i686" "x86_64")
url="http://www.qore.org/"
license=('GPL2', "LGPL2")
groups=()
depends=("openssl")
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
source=("http://sourceforge.net/projects/qore/files/module-json/1.0/qore-json-module-1.0.tar.bz2" "configure.patch")
noextract=()

md5sums=('12518e02b191c1503f5d23faed12c3cc'
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
