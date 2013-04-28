# Maintainer: Christian Bühler <christian.buehler@ipoplan.de>
pkgname=quarter
pkgver=464.a941589f50f9
pkgrel=1
pkgdesc="Light-weight glue library that provides seamless integration between Coin and Qt"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Coin3D/quarter"
license=('BSD')
depends=('coin-hg' 'mesa' 'qt4')
makedepends=('mercurial')
source=(hg+https://bitbucket.org/Coin3D/quarter)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -D COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
