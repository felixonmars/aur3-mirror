pkgname=kickass
pkgver=0.2
pkgrel=1
pkgdesc="Little KDE utility for running and switching applications using designated keyboard shortcuts"
arch=('i686')
url="http://kickass.metatribe.org"
license=('GPL')
groups=()
depends=('kdelibs>=4.1.0')
makedepends=('cmake' 'make' 'gcc')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://kickass.metatribe.org/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('0bc699b8cd479a81e5400ba5084a1c5d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cd "build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

