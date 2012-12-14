# Contributor: Sebastien Binet <binet@cern.ch>
pkgname=aida
pkgver=3.2.1
pkgrel=1
pkgdesc="Abstract Interfaces for Data Analysis"
arch=('any')
url="http://aida.freehep.org/"
license=('LGPL')
depends=()
makedepends=()

source=(
  "ftp://ftp.slac.stanford.edu/software/freehep/AIDA/v$pkgver/aida-$pkgver-src.tar.gz"
)
md5sums=('c35073da04abfdd96ac9f4801f3da473')


build()
{
	cd "$srcdir"
}

package()
{
  mkdir -p "$pkgdir/usr/include"
  cp -r "$srcdir/src/cpp/AIDA" "$pkgdir/usr/include/"
  rm "$pkgdir/usr/include/AIDA/.nbattrs"
}

