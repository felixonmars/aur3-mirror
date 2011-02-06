# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Nick Parastatidis <nparasta@auth.gr>
pkgname=englab
pkgver=0.3.0
pkgrel=1
pkgdesc="Console interface for Englab" 
url="http://www.englab.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs' 'libenglab')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
md5sums=('2d93fa4d22967921be43b33631ccf530')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
