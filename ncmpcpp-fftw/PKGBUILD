# Maintainer: Erus <erus.iluvatar@gmail.com>

pkgname=ncmpcpp-fftw
_pkgname=ncmpcpp
pkgver=0.5.10
pkgrel=1
pkgdesc="An almost exact clone of ncmpc with some new features, fftw visualisation enabled."
arch=('i686' 'x86_64')
url="http://unkart.ovh.org/ncmpcpp/"
license=('GPL')
conflicts=(${_pkgname})
provides=(${_pkgname})
depends=('curl' 'libmpdclient' 'taglib' 'ncurses' 'fftw')
install=${pkgname}.install
source=(http://unkart.ovh.org/ncmpcpp/${_pkgname}-${pkgver}.tar.bz2)

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
         --enable-outputs \
         --enable-visualizer \
         --enable-clock \
         --enable-unicode \
         --with-curl \
         --with-fftw \
         --with-taglib
  make
  make DESTDIR="$pkgdir" install
}
md5sums=('298ed66325bcfe358e37e186c7ea4861')
sha512sums=('8ddbc05bd8f3febe80cc5c04992a02f8c86151bb171f8f2e46e8df79210f9445e73fd65bdcaa397b3039ebcf510c6bb6ef61be790a6dcf07d5e35e59f71f3702')
