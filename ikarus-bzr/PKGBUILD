# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=ikarus-bzr
pkgver=1870
pkgrel=3
pkgdesc="Ikarus R6RS Scheme compiler"
arch=('x86_64')
url="https://launchpad.net/ikarus"
license=('GPL3')
depends=('gmp')
makedepends=('bzr')
provides=('ikarus')
conflicts=('ikarus')
source=('ikarus::bzr+http://bazaar.launchpad.net/~aghuloum/ikarus/ikarus.dev/' 'ikarus.profile' 'am.patch')
md5sums=('SKIP'
         'ba82a82640e064a075efe2a6649a52dd'
         '5c7806622a9a439ced25f7037acda1d4')
_bzrmod=ikarus

pkgver() {
  bzr revno $srcdir/$_bzrmod
}

prepare() {
  cd "$srcdir/$_bzrmod"
  patch -p1 < $srcdir/am.patch
}

build() {
  cd "$srcdir/$_bzrmod"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod"
  make DESTDIR="$pkgdir/" install
  install -Dm755 $srcdir/ikarus.profile $pkgdir/etc/profile.d/ikarus.sh 
  cd $pkgdir/usr/lib/ikarus
  ln -s  ../../share/ikarus/ikarus.boot ikarus.boot
}
