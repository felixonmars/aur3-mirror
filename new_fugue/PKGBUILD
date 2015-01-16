# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=new_fugue
pkgver=1
_pkgver='2010-06-02'
pkgrel=1
pkgdesc="For estimation of haplotype frequencies and linkage disequilibrium coefficients in family data."
arch=('x86_64')
url="http://genome.sph.umich.edu/wiki/New_Fugue"
license=('custom')
depends=('gcc-libs' 'zlib')

source=("http://www.sph.umich.edu/csg/abecasis/downloads/generic-${pkgname}-${_pkgver}.tar.gz")

md5sums=('ee1f98cf98d631956d4325fa8d57996d')

prepare() {
  cd "generic-$pkgname"
  perl -pi -e 's#INSTALLDIR=/usr/local/bin#INSTALLDIR=/usr/bin#' Makefile
	#patch -p1 -i "$srcdir/$pkgname-$_pkgver.patch"
}

build() {
  cd "generic-$pkgname"
  make
}

package() {
  cd "generic-$pkgname"
  make DESTDIR="$pkgdir/" install INSTALLDIR="$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/licenses/new_fugue"
  install -m0644 LICENSE.twister "$pkgdir/usr/share/licenses/new_fugue"
  cd "$pkgdir/usr/share/licenses/new_fugue"
  ln -s LICENSE.twister LICENSE
}
