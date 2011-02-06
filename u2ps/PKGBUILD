# Maintainer: Alex Suykov <axs@ukr.net>
#
# Note: to maintain Fontmap/resmap consistency, per-package maps
# are installed with suffixes added and install script is used to
# generat primary files.
#
pkgname=u2ps
pkgver=0.8.1
pkgrel=3
pkgdesc="Unicode to PostScript converter"
arch=('i686' 'x86_64')
url="http://u2ps.berlios.de"
license=('GPL')
groups=()
depends=(ghostscript perl perl-text-charwidth)
makedepends=(ghostscript perl perl-text-charwidth)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=u2ps.install
source=(http://download.berlios.de/u2ps/$pkgname-$pkgver.tar.gz u2ps.install)
noextract=()
md5sums=('0f392cc4c3f1c1836ae5aabeff3c1d2c'
         'd7e0a3706ba42bfcacffd1145153b83c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/share/u2ps/ps
  mv resmap resmap.0
  mv Fontmap Fontmap.0
}

# vim:set ts=2 sw=2 et:
