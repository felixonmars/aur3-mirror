# Maintainer: Carl Mueller  archlinux at carlm e4ward com
# Contributor: Biotin 
pkgname=kflickr
arch=('i686' 'x86_64')
pkgver=20100817
pkgrel=1
pkgdesc="A standalone Flickr.com uploader for KDE"
url=(http://kflickr.sourceforge.net/)
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
optdepends=('kdebase-runtime')
source=(http://downloads.sourceforge.net/sourceforge/kflickr/$pkgname-$pkgver.tar.bz2)
md5sums=('a242994345de077c2a4bd07968cc217a')
build() {
  cd $srcdir/$pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=RELEASE
  make || return 1
  make DESTDIR=$pkgdir install
}
