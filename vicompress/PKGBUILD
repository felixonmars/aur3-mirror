# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Oster <thomas.oster@rwth-aachen.de>
pkgname=vicompress
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="HTTP Compression & Caching Solution (Proxy Server)"
arch=(i686 x86_64)
url="http://visolve.com/vicompress"
license=('GPL')
groups=()
depends=()
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
source=(http://www.visolve.com/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('ec8da6a5f9c30c5a08a539c326b07248')
build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  ./configure /usr/share/$pkgname/
  # Patch Makefile for DESTDIR and PREFIX support
  sed 's#${PREFIX}#${DESTDIR}${PREFIX}#g' < Makefile|sed 's#${DESTDIR}${PREFIX}|g#${PREFIX}|g#g' > Makefile.fixed
  rm Makefile
  mv Makefile.fixed Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/etc/rc.d
  ln -s /usr/share/$pkgname/bin/$pkgname.sh $pkgdir/etc/rc.d/$pkgname
}

