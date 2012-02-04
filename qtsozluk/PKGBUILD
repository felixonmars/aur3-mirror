# Contributor: Dincer Celik <dincer@bornovali.com>

pkgname=qtsozluk
pkgver=2.1
pkgrel=2
arch=("i686" "x86_64")
pkgdesc="English->Turkish & Turkish->English dictionary."
license="GPL"
url="http://projects.comu.edu.tr/qtsozluk/"
source="ftp://ftp.comu.edu.tr/pub/linux/prog/qtsozluk/$pkgname-$pkgver.tar.gz"
md5sums="9ee29be70f257ebe4c60c6edfc7a4de9"
depends="qt>=3.3"
makedepends=()
conflicts=()
replaces=()

build() {
  cd $startdir/src/$pkgname-$pkgver/
  qmake -o Makefile qtsozluk.pro
  make || return 1
  install -D -m755 $startdir/src/$pkgname-$pkgver/qtsozluk $startdir/pkg/usr/bin/qtsozluk
  install -D -m755 $startdir/src/$pkgname-$pkgver/sozlukeng.e2t $startdir/pkg/usr/share/qtsozluk/sozlukeng.e2t
  install -D -m644 $startdir/src/$pkgname-$pkgver/sozlukeng.t2e $startdir/pkg/usr/share/qtsozluk/sozlukeng.t2e
  install -D -m644 $startdir/src/$pkgname-$pkgver/sozluktur.e2t $startdir/pkg/usr/share/qtsozluk/sozluktur.e2t
  install -D -m644 $startdir/src/$pkgname-$pkgver/sozluktur.t2e $startdir/pkg/usr/share/qtsozluk/sozluktur.t2e
}
