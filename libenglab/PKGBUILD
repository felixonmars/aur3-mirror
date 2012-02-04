# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Nick Parastatidis <nparasta@auth.gr>
pkgname=libenglab
pkgver=0.3.0
pkgrel=1
pkgdesc="Main library for Englab, a mathematical platform" 
url="http://www.englab.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
md5sums=('f8b9f9ec9c825210d6abe3d63b42291f')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr  || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
