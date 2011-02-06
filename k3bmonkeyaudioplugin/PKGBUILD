# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=k3bmonkeyaudioplugin
pkgver=3.1
pkgrel=2
pkgdesc="Plugin for K3B to allow encoding to, and decoding from lossless Monkey's Audio format"
arch=('i686')
url="http://k3b.org/"
license="GPL"
depends=('k3b>=0.12.0' 'kdelibs3')
makedepends=('make' 'nasm')
source=(http://switch.dl.sourceforge.net/sourceforge/k3b/$pkgname-$pkgver.tar.bz2)
md5sums=('7ca0a8f9fcf9c2695e8e3484c7ce58a9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --without-arts
  make || return 1
  make DESTDIR=$startdir/pkg install
}
