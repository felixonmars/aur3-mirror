# Contributor: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=psofit
pkgver=0.1.0
pkgrel=1
license=(GPL)
pkgdesc="Program to adjust the Cole function (and derivatives) parameters based on an input impedance spectrum."
arch=('i686' 'x86_64')
url="http://oproj.tuxfamily.org" 
depends=('cpso')
makedepends=('gcc')
source=("http://downloads.tuxfamily.org/oproj/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=("1616cb910424c3e39e595ed19cfe1775")

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  make
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname-$pkgver/psofit" "$pkgdir/usr/bin/psofit"
}
