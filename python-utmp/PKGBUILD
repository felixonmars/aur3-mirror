# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
# goes in devel or system?
_pkgroot=python-utmp
pkgname=python-utmp
pkgver=0.8
pkgrel=1
pkgdesc="Modules to access utmp from python."
arch=(any)
url="http://korpus.juls.savba.sk/~garabik/software/python-utmp/"
license=('GPL')
depends=('python')
source=("http://korpus.juls.savba.sk/~garabik/software/${_pkgroot}/${_pkgroot}_${pkgver}.tar.gz"
	"slight_compat_fixes.patch")

build() {
  cd "$srcdir/$_pkgroot-$pkgver"
  patch -Np1 -i "$srcdir/slight_compat_fixes.patch"
  PYTHONVER=3.2mu make -f Makefile.glibc
}

package() {
  cd "$srcdir/$_pkgroot-$pkgver"

  PYTHONVER=3.2mu DESTDIR="$pkgdir/" make install
}

md5sums=('94c3ac2b455c7593ba0d172717e56223'
         'b51ef12b07f9ae83df28bc5ff9b0e39a')
sha256sums=('3184717bace2cd92cd0609ca5c310af684fe6ab6fc5cc774198136d8a8d2506a'
            'f85e33ad5d7d35635ecff3dfe63d65d2b7d21ea3beca6f480e202406f6cdf969')
