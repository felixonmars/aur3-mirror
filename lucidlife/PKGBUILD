# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Javier ‘Phrodo_00’ Aravena <Phrodo.00@gmail.com>
pkgname=lucidlife
pkgver=0.9.2
pkgrel=1
pkgdesc="Program for investigating and playing with Conway's Life,"
arch=('i686' 'x86_64')
url='http://icculus.org/~jcspray/LucidLife'
license=('GPL')
depends=('gtk2' 'gnome-vfs')
makedepends=('perl-xml-parser')
source=('http://mirror.thecodergeek.com/src/lucidlife-0.9.2.tar.gz')
md5sums=('7108027c71cf145afa06e7df625619e9')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}
