# Maintainer: Piotr Kempa <kosmici (dash) atakuja (at) wp (dot) pl>
pkgname=cpipe
pkgver=3.0.2
pkgrel=1
pkgdesc="Counting pipe"
arch=('i686' 'x86_64')
url="http://cpipe.berlios.de/"
license=('GPL')
depends=('glibc')
source=(http://download2.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a34f2752628c45d52a99dc38b75d89cb')
build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  make install prefix=$pkgdir/usr || return 1
  cd $pkgdir
  mkdir -p usr/share/man
  mv usr/man/man1 usr/share/man/
  rm -r usr/man
  chmod -x usr/share/man/man1/*
}
