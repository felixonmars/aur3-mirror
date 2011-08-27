# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=englab-special_functions
pkgver=0.2.1alpha
pkgrel=1 
pkgdesc="Englab-toolbox for special functions based on gnu scientific library"
url="http://englab.bugfest.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs' 'gsl')
makedepends=('libenglab')
options=('!emptydirs')
optdepends=('englab: will bee needed, or englabgui will be needed')
install=$pkgname.install
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
md5sums=('60be7b76c7f3a1fb4b5f4b83d2edc343')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  sed -i 's/ldconfig//g' src/makefile || return 1
  make DESTDIR=$pkgdir install || return 1 
  rm -rf $pkgdir/usr/share/doc || return 1
}