# Maintainer: Kyle Temkin <kyle at ktemkin dot com> 

pkgname=('espresso')
pkgver=1.0
pkgrel=1
pkgdesc="Heuristic logic minimizer; reduces the amount of gates required for digital circuits."
arch=('i686' 'x86_64')
url="http://code.google.com/p/eqntott/"
license=('MIT')
groups=()
depends=('glibc')
optdepends=('eqntott: equation-based input')
source=(http://eqntott.googlecode.com/files/$pkgname-ab-$pkgver.tar.gz)
md5sums=('1c60ac344779dc8753f8e0785eafd8ac')

build() {
  cd $srcdir/$pkgname-ab-$pkgver
  
  #autogenerate makefile
  ./configure --prefix=/usr || return 1
  
  #build
  make || return 1
  
}

package() {
  cd $srcdir/$pkgname-ab-$pkgver
  
  #install
  make DESTDIR=$pkgdir install || return 1
  
  #install licesnse
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
