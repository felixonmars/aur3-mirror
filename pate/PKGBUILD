# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=pate
pkgver=0.5.1
pkgrel=1
pkgdesc="Pate is a plugin for Kate on KDE3 that allows you to create new plugins in Python for Kate."
arch=(i686)
url="http://paul.giannaros.org/pate/"
license=('GPL2')
depends=('kdebase3' 'kate-plugins' 'python')
makedepends=('cmake')
source=(http://paul.giannaros.org/pate/releases/source/$pkgname-$pkgver.tar.gz)
md5sums=('8ef05e14c6b43c45046ec77d44da103d')

build() {
   . /etc/profile.d/qt3.sh
   . /etc/profile.d/kde3.sh
   cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde
   cd build
   make || return 1
   make DESTDIR=$startdir/pkg install

}

