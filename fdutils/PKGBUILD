# Contributor: Laurent Hilsz <laurent.hilsz@laposte.net> 
pkgname=fdutils
pkgver=5.5
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Utilities for the Linux floppy driver, i.e. for formatting extra capacity disks"
url="http://fdutils.linux.lu/index.html"
makedepends=('texinfo' 'tcc')
depends=('glibc' 'tcc' 'texinfo')
source=(http://fdutils.linux.lu/$pkgname-$pkgver.tar.gz)
md5sums=('2b8b65f52378158a4a21e455566b456d')
install=fdutils.install
options=('!strip' '!makeflags' '!buildflags')
license=('GPL')

build() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/etc
  export CC=tcc
  ./configure --prefix=$pkgdir/usr --sysconfdir=$pkgdir/etc \
              --infodir=$pkgdir/usr/share/info || return 1
  sed -i 's+-c -s -m+-c -m+g' src/Makefile || return 1
  make || return 1
  make install || return 1
}
