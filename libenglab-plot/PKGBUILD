# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nick Parastatidis <nparasta@auth.gr>
pkgname=libenglab-plot  
pkgver=0.3.0
pkgrel=1
pkgdesc="Toolbox for plotting in englab"
url="http://englab.bugfest.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs' 'libenglab' 'mathgl>=1.8')
makedepends=('libenglab' 'mathgl')
install=$pkgname.install
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz makefile.patch)
md5sums=('65cb72aae9d077d4da23f84a4d88e60c' '68242f3f3c31ecff3148d9786c23844c')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc CXXFLAGS="-O0" || return 1
  patch -Rn src/makefile ../../makefile.patch
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
