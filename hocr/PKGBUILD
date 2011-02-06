# Contributor: Jack <nim901@gmail.com>
pkgname=hocr
pkgver=0.8.2
pkgrel=1
pkgdesc="HOCR is a Hebrew character recognition c/c++ library."
depends=('gtk')
url="http://hocr.berlios.de/"
source=(http://download.berlios.de/hocr/$pkgname-$pkgver.tar.gz)
md5sums=(db1e475ec38663e41fc2e95f60c02596)

build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make
make DESTDIR=$startdir/pkg install
}
