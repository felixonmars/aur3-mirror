# Maintainer: David Townshend

pkgname=swmm5
pkgver=5.0.018
pkgrel=1
pkgdesc='Storm Water Management Model Engine'
arch=('i686' 'x86_64')
url='http://www.epa.gov/ednnrmrl/models/swmm/'
license=('custom:None')
#depends=('kernel26>=2.6.29')
makedepends=('unzip')
source=(http://www.epa.gov/ednnrmrl/models/swmm/swmm${pkgver//./}engine.zip swmm5.c.patch)

makezip="makefiles.zip"
gnumakezip="GNU_CON.zip"
srczip="source$(echo $pkgver | tr \. \-).ZIP"

md5sums=(5d7d1a11f206b7fcd21413bacf0882f5 93d07dcc87ffc5624abf6eacd4775672)

build() {
  cd $srcdir/$pkgname-$pkgver
  unzip -o [source].zip
  unzip -o $srczip
  unzip -o $makezip $gnumakezip
  unzip -o $gnumakezip Makefile

  patch swmm5.c swmm5.c.patch

  make || return 1

  mkdir -p $pkgdir/usr/bin
  mv swmm5 $pkgdir/usr/bin/
}

