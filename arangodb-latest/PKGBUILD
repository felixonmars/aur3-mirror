# Maintainer: Christoph Grabo <asaaki@mannaz.cc>
#
# based on:
# - https://aur.archlinux.org/packages/arangodb
# - https://aur.archlinux.org/packages/arangodb-git

pkgname=arangodb-latest
pkgver=2.3.0
pkgrel=4
pkgdesc="A distributed open-source database with a flexible data model for documents, graphs, and key-values."
provides=("arangodb")
conflicts=("arangodb" "arangodb-git")

arch=("i686" "x86_64")
url="https://www.arangodb.com/"
license=("Apache")
depends=("openssl" "readline" "icu" "systemd")
makedepends=("go" "python2")
install=arangodb.install
source=(  "https://github.com/triAGENS/ArangoDB/archive/v2.3.0.tar.gz"
          "arangodb.service")
md5sums=( "c7ef54f2a1d29ff73bc29282e2218a3c"
          "3cdd43ed5552ab918b41627ec4906e52")

build() {
  ln -s -f /usr/bin/python2 python
  export PATH="`pwd`:$PATH"

  cd $srcdir/ArangoDB-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  cd $srcdir/ArangoDB-$pkgver
  make -k check
}

package() {
  cd $srcdir/ArangoDB-$pkgver
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/share/doc/arangodb
  cp -R $srcdir/ArangoDB-$pkgver/Documentation/* $pkgdir/usr/share/doc/arangodb/

  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/arangodb.service $pkgdir/usr/lib/systemd/system/
}
