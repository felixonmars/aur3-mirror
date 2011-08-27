# Contributor: Simone Lazzaris <simone@omni.it>
pkgname=tweak
pkgver=0.2.2
pkgrel=1
pkgdesc="KDE option tweaker"
arch=('i686')
url="http://smileaf.org/projects/"
license=('GPL')
groups=()
depends=('kde-common' 'kdelibs')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('http://smileaf.org/files/tweaK/tweaK-0.2.2.tar.bz2')
noextract=()
md5sums=(68db636a77a0a7d89874f7958874c57d) 

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
