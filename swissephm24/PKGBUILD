pkgname='swissephm24'
pkgver='2001.05.03'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst (2401 BC - 1802 BC).'
arch=('any')
license=('GPL')
groups='swisseph-all'
url=('http://www.astro.com/swisseph/')
depends=()
makedepends=()
optdepends=()
source=('http://www.astro.com/ftp/swisseph/ephe/archive_gzip/swephm24.tar.gz')
md5sums=('5f422b54ced947031ddcdf0e573f6a27')

build() {
    install -d -m 755 $pkgdir/usr/share/swisseph/
    install -m 755 $srcdir/*.se1 $pkgdir/usr/share/swisseph/
}

