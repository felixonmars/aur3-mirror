# Contributor: Federico Quagliata (quaqo) <linux@quaqo.org>

pkgname=k3guitune
pkgver=1.01
pkgrel=1
pkgdesc="A KDE Guitar Tune"
url="http://home.planet.nl/~lamer024/k3guitune.html"
depends=('kdelibs' 'fftw')
license=('GPL2')
arch=('i686')
source=(http://home.planet.nl/~lamer024/files/$pkgname-$pkgver.tar.gz)
md5sums=('b8202c935f47c18003e8cba14faf18d6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  mkdir -p $startdir/pkg/opt/kde
  make prefix=$startdir/pkg/opt/kde install
}
