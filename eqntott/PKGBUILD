# Maintainer: Kyle Temkin <kyle at ktemkin dot com> 

pkgname=('eqntott')
pkgver=9.0
pkgrel=1
pkgdesc="Utility to convert a set of boolean logic equations to a PLA-esque truth table."
arch=('i686' 'x86_64')
url="http://code.google.com/p/eqntott/"
license=('BSD')
groups=()
depends=('glibc')
optdepends=('espresso: minimization of output logic')
source=(http://eqntott.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('a029f83d885d2ed3af0c569a8f0bab12')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  #autogenerate makefile
  ./configure --prefix=/usr || return 1
  
  #build
  make || return 1
  
}

package() {
  cd $srcdir/$pkgname-$pkgver
  
  #install
  make DESTDIR=$pkgdir install || return 1
  
  #install licesnse
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
