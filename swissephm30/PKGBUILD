pkgname='swissephm30'
pkgver='2001.05.03'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst (3001 BC - 2402 BC).'
arch=('any')
license=('GPL')
groups='swisseph-all'
url=('http://www.astro.com/swisseph/')
depends=()
makedepends=()
optdepends=()
source=('http://www.astro.com/ftp/swisseph/ephe/archive_gzip/swephm30.tar.gz')
md5sums=('22fbef1a68d3af3a018e4b97d5a53fff')

build() {
    install -d -m 755 $pkgdir/usr/share/swisseph/
    install -m 755 $srcdir/*.se1 $pkgdir/usr/share/swisseph/
}

