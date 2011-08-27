# Contributor: <tuxsavvy-noms@yahoo.com.au>
pkgname=mtd-utils_20090606
pkgver=0
pkgrel=1
pkgdesc="The mtd-utils package contains utilities related to handling MTD devices, and for dealing with FTL, NFTL JFFS2 etc. This package is only made for owners of Nokia N900 wishing to use the same mtd-utils version as per pre-made setup."
arch=(i686)
url="http://www.linux-mtd.infradead.org/"
license=('GPLv2+')
replaces=(mtd-utils)
source=(http://mtd-utils.sourcearchive.com/downloads/20090606/${pkgname}.orig.tar.gz)

build() {
  cd "$srcdir/$pkgname"

  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('29bd8ef4e7a159339c1c16fdd0468bc5')
