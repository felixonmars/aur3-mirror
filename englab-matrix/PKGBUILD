# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=englab-matrix
pkgver=0.2.1alpha
pkgrel=1 
pkgdesc="Englab-toolbox for the manipulation of 2-D matrices"
url="http://englab.bugfest.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
makedepends=('libenglab' 'newmat')
options=('!emptydirs')
optdepends=('englab: will bee needed, or englabgui will be needed')
install=$pkgname.install
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
md5sums=('dcd2ecdb1bebf88aceef6eb7370f97ca')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  sed -i 's/ldconfig//g' src/makefile || return 1
  make DESTDIR=$pkgdir install || return 1 
  rm -rf $pkgdir/usr/share/doc || return 1
}