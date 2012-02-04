# Contributor: Your Name <jorispeeraer@gmail.com>
pkgname=bcp
pkgver=20011229
pkgrel=1
pkgdesc="Tool for copying files over network using UDP protocol."
arch=(i686)
url="http://atrey.karlin.mff.cuni.cz/~clock/creat.html"
license=('GPL2')
source=("ftp://atrey.karlin.mff.cuni.cz/pub/local/clock/bcp/$pkgname-$pkgver.tgz" "makefile.patch" "multilines.patch")
noextract=()
md5sums=('2ecd273d34455d43d23cdd03db40b9ab'
         '0005fb081ed832e1474e5a0c5011f517'
         'e666413f4f13a17011d1ab20e8d9bcb3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np0 < $startdir/src/makefile.patch || return 1
  patch -Np0 < $startdir/src/multilines.patch || return 1

  make || return 1
  mkdir -p $pkgdir/usr/bin
  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
