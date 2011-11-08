pkgname='swissephm18'
pkgver='2001.05.03'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst (1801 BC - 1202 BC).'
arch=('any')
license=('GPL')
groups='swisseph-all'
url=('http://www.astro.com/swisseph/')
depends=()
makedepends=()
optdepends=()
source=('http://www.astro.com/ftp/swisseph/ephe/archive_gzip/swephm18.tar.gz')
md5sums=('7e989ef691c15b0d2a4c434fd5c7bb91')

build() {
    install -d -m 755 $pkgdir/usr/share/swisseph/
    install -m 755 $srcdir/*.se1 $pkgdir/usr/share/swisseph/
}

