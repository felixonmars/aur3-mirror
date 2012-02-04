# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=yasdp
pkgver=0.9.2
pkgdesc="Yet another ShutDown Plasmoid"
pkgrel=4
arch=(i686 x86_64)
url="http://kde-look.org/content/show.php?content=126013"
license=(GPL)
makedepends=(cmake automoc4)
depends=(kdebase-workspace)
options=()
source=(http://kde-look.org/CONTENT/content-files/126013-${pkgname}-${pkgver}.tar.gz
	fixes.patch)
md5sums=('5fb3d03c9e0324812503e2d0417cd6db'
         '55920c2996a651ee5765b2a467f4b1e6')
sha1sums=('5b6bc541bf74cef3b5290e0cd99abc05f91074a5'
          'ed960670e5d7212da67030f7d19f486ac0e48673')

build() {
  cd "${srcdir}/yaSDP"

# Apply patches
  patch -Np1 < ${srcdir}/fixes.patch

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` . || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
