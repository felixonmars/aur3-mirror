# Contributor: aeolist <aeolist@hotmail.com>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=mesure
pkgver=0.7.2
pkgrel=3
pkgdesc="This tool allows to mesure how a file grows, network transfer, disk free, memory usage, stdin flux, etc. It supports ETA and progressbar output too."
arch=('i686' 'x86_64')
url="http://nopcode.org/blog/mesure.html"
license="GPL"
depends=('gmp' 'libpcap')
source=(ftp://ftp.nopcode.org/prj/mesure/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr --install=/bin/install
  make || return 1
  install -D -m755 -s $startdir/src/$pkgname-$pkgver/src/mesure $startdir/pkg/usr/bin/mesure
  install -D -m444 $startdir/src/$pkgname-$pkgver/doc/mesure.1 $startdir/pkg/usr/share/man/man1/mesure.1
}

md5sums=('91ad0f58194a7bd1acc1b7c016305dc4')
