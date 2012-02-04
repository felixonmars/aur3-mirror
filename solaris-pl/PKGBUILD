# Maintainer: phlowx <phlowx[at]googlemail.com>
pkgname=solaris-pl
pkgver=0.6.0rc6
_dlver=0.6.0-rc6
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Solaris Porting Layer"
makedepends=('linux-headers')
url="http://github.com/zfsonlinux/spl"
source=(https://github.com/downloads/zfsonlinux/spl/spl-$_dlver.tar.gz)

md5sums=('6adad5ae35d89c4251612bbb243b236a')
install=solaris-pl.install
license=('GPL')
build() {
  echo $srcdir
  echo $pkgdir
  cd $srcdir/spl-$_dlver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
