# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Nick Parastatidis <nparasta@auth.gr>
pkgname=libenglab-cimg  
pkgver=0.3.0
pkgrel=1 
pkgdesc="Englab toolbox for the C++ Template Image Processing Toolkit"
url="http://www.englab.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('cimg' 'libenglab')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
install=libenglab-cimg.install
md5sums=('442e7e89be288bf2ee3cbe489319d784')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install  || return 1
}
