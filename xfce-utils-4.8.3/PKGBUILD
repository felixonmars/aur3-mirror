pkgname=xfce-utils-4.8.3
pkgver=0.1
pkgrel=1
pkgdesc="Utilities for Xfce"
url="http://www.xfce.org/"
arch=(i686 x86_64)
license=(GPL)
depends=()
makedepends=()
groups=()
source=(https://launchpadlibrarian.net/80767913/xfce4-utils_4.8.3.orig.tar.bz2)
md5sums=(03b5fba5f63f4f1a31cc7d3728f3c87e)

build() {
  cd $srcdir/$pkgname
    ./configure
    make || return 1
    make DESTDIR=$pkgdir install || return 1
      }
