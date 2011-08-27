# Contributor: Kio M. Smallwood <k.smallwood@daxtra.com>
pkgname=cciss_vol_status
pkgver=1.06
pkgrel=1
pkgdesc="HP SmartArray diagnostic tool"
arch=('i686')
url="http://cciss.sourceforge.net/"
license=('GPL')
makedepends=('linux-api-headers')
source=(http://sourceforge.net/projects/cciss/files/$pkgname/$pkgname-$pkgver.tar.gz $pkgname.patch)
md5sums=('210b97af7adeb601a49ee0e743c4d2b7' '5eeb8df0cd26abfdb720bf4b903b9fd8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../$pkgname.patch || return 1

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
