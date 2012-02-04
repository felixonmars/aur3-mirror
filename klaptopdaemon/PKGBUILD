# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=klaptopdaemon
pkgver=3.5.9
pkgrel=1
pkgdesc="Laptopdaemon for KControl"
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.kde.org"
depends=('kdelibs=3.5.9' 'libxtst')
source=(ftp://download.kde.org/pub/kde/stable/$pkgver/src/kdeutils-$pkgver.tar.bz2)
conflicts=('kdeutils')
md5sums=('dbe5ddff57141f27778601df5571e182')

build() {
  cd $startdir/src/kdeutils-$pkgver
  ./configure --prefix=/opt/kde --disable-debug --disable-dependency-tracking \
  --enable-gcc-hidden-visibility --enable-final DO_NOT_COMPILE="ksim"
  #        --enable-final # remove this if you build with < 512mb ram.
  cd $startdir/src/kdeutils-$pkgver/$pkgname
  make || return 1
  make DESTDIR=$startdir/pkg install

  cd $startdir/src/kdeutils-$pkgver/doc/kcontrol/
  make || return 1
  make DESTDIR=$startdir/pkg install
}
