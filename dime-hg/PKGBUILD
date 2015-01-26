# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=dime-hg
pkgver=r187.7cd55bc6a6d0
pkgrel=1
pkgdesc="A library for reading, constructing, manipulating, and writing DXF files"
arch=('i686' 'x86_64')
url="http://www.coin3d.org/lib/dime/"
license=('GPL')
makedepends=('mercurial')
source=('dime-hg::hg+https://bitbucket.org/Coin3D/dime')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr || return 1
  make || return 1
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

