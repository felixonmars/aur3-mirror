# Contributor: Emmanuele Massimi <finferflu@gmail.com>
pkgname=bfsms
pkgver=0.11
pkgrel=1
pkgdesc="Send SMS from a bluetooth-capable PC and a bluetooth equipped mobile."
depends=(bluez-libs)
arch=('i686')
url="http://sourceforge.net/projects/bfsms/"
license=('GPL')
install=
source=(http://surfnet.dl.sourceforge.net/sourceforge/bfsms/$pkgname\_v.$pkgver.tar.gz)
md5sums=('75c3f9864916f9edef4affd056749e1d')

build() {
  cd $srcdir/"$pkgname"_v."$pkgver"
  sed -i -e "s#/usr/bin#\$(DESTDIR)#g" Makefile
  mkdir -p $pkgdir/usr/bin 
  make || return 1
  make DESTDIR="$pkgdir/usr/bin" install
}

# vim:set ts=2 sw=2 et:
