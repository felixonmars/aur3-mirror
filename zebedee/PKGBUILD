# Contributor: Andreas Schweitzer <andy@bootblock.de>
pkgname=zebedee
pkgver=2.4.1A
pkgrel=1
pkgdesc="A tool to establich a blowfish encrypted tunnel."
url="http://www.winton.org.uk/zebedee/"
groups=('')
depends=('zlib' 'openssl' 'bzip2')
makedepends=('perl')
backup=('')
provides=('')
replaces=('')
install=
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('2333f76aa2852a10636ac303bef9205b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  cat >> Makefile << END
BFINC = -I/usr/include/openssl
BFLIB = -lcrypto
ZINC = 
ZLIB = -lz
BZINC = 
BZLIB = -lbz2
OPTIM = $CFLAGS
ZBDDIR = \$(ROOTDIR)/share/zebedee
END
  make OS=linux || return 1
  make ROOTDIR=$startdir/pkg/usr OS=linux install
}
