# Contributor/Maintainer: Nick Parastatidis <nparasta@auth.gr>
pkgname=libenglab-dsp
pkgver=0.3.0
pkgrel=1 
pkgdesc="Englab toolbox for digital signal processing"
url="http://www.englab.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsndfile' 'audiere' 'libenglab')
source=(http://downloads.sourceforge.net/englab/$pkgname-$pkgver.tar.gz)
install=libenglab-dsp.install
md5sums=('471cd4029beb78c1db1e092552c5a434')
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr CXXFLAGS="-O0" || return 1
  make || return 1
  make DESTDIR=$pkgdir install  || return 1
}
