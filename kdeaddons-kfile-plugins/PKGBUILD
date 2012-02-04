# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=kdeaddons-kfile-plugins
pkgver=3.5.9
pkgrel=1
pkgdesc="KDE file dialog plugins for text files and folders without the need to install kdeaddons"
arch=('i686')
url="http://www.kde.org"
license="GPL"
depends=('kdelibs>=3.5.9')
groups=('kde')
makedepends=(qt)
conflicts=('kdeaddons')
source=(ftp://ftp.kde.org/pub/kde/stable/$pkgver/src/kdeaddons-$pkgver.tar.bz2)
md5sums=('eaa3832a25b483d1a9613f75991c3d7b')

build() {
  cd $startdir/src/kdeaddons-$pkgver
  ./configure --prefix=/opt/kde --disable-debug --disable-dependency-tracking
  cd kfile-plugins || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
