# Contributor: hpestilence <hpestilence@gmail.com>
pkgname=pok3d-data
pkgver=1.1.29
pkgrel=1
pkgdesc="Data for use with Pok3d"
arch=('i686')
url="http://www.pok3d.com/"
license=('custom')
provides=('poker3d-data')
conflicts=('poker3d-data')
install="pok3d-data.install"
groups=('pok3d')
source=(http://pok3d.net/gentoo-non-free/poker3d-data-$pkgver.tar.gz \
        house-rules.txt)
md5sums=('f5e0b71551fcc961004646f5582c6fbb' '8cdf48dcd7b2414d18958b31f573972d')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share/poker3d
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  cp house-rules.txt $startdir/pkg/usr/share/licenses/$pkgname/
  cp -R data $startdir/pkg/usr/share/poker3d
}
