# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=gmms
pkgver=0.0.1
pkgrel=1
pkgdesc="gmms is a simple MMS-stream downloader"
arch=('i686' 'x86_64')
url="http://gmms.sourceforge.net/"
license=('GPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/project/gmms/gmms/0.0.1/gmms.zip)
md5sums=('3c872ece6e995ab477000ecf1d025de7')

build() {
  cd "$srcdir/$pkgname/src"

  make || return 1
  install -D -m755 $srcdir/$pkgname/src/gmms $pkgdir/usr/bin/gmms
}
