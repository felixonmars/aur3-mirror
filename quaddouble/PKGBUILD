# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>
# Maintainer: Rémy Oudompheng <oudomphe@clipper.ens.fr>
pkgname=quaddouble
pkgver=2.3.7
pkgrel=1
pkgdesc="Library for quad-double arithmetic"
arch=('i686' 'x86_64')
url="http://www.cs.berkeley.edu/~yozo/"
license=('BSD')
depends=()
source=(http://www.cs.berkeley.edu/%7Eyozo/software/qd-$pkgver.tar.gz)

build() {
  cd "$startdir/src/qd-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

md5sums=('8a66004a0eead55cf3cca87ddf3b69d8')
