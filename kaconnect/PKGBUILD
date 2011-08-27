# Contributor:  Leslie P. Polzer <polzer@stardawn.org>
pkgname=kaconnect
pkgver=1.1.1
pkgrel=1
pkgdesc="Graphical ALSA MIDI patch bay"
url="http://alsamodular.sourceforge.net/"
license="GPL"
arch=('i686')
depends=(alsa-lib qt3)
source=(http://mesh.dl.sourceforge.net/sourceforge/alsamodular/$pkgname-$pkgver.tar.bz2)
md5sums=('df012e2d7062f9055a031e74fb10f217')
sha1sums=('525dc68d7ecc6e1d14477e105b897db9eb60fa6d')

build() {
  cd $startdir/src/$pkgname-$pkgver

  patch -Np1 -i $startdir/kaconnect.diff

  make -f make_kaconnect || return 1

  install -m755 -D kaconnect $startdir/pkg/usr/bin/kaconnect
}
