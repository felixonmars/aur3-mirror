# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname="runit-scripts"
pkgver="11.6"
pkgrel=1
pkgdesc="Some scripts for runit"
arch=(any)
depends=()
makedepends=()
optdepends=()
url="http://people.oh14.de/andrej/runit-scripts"
source=(http://people.oh14.de/andrej/runit-scripts/runit-scripts-11.6-stickbuild.tar.xz)
license="custom"
build()
{
 cd "$srcdir/$pkgname-$pkgver"
 export PREFIX=/usr
 export ETCDIR=/etc
 export BINDIR=$PREFIX/bin
 export LIBDIR=$PREFIX/lib
 export DESTDIR="${startdir}/pkg"
 make || return 1
 make install
}
md5sums=('5888a5b5637a65886a3351e853668379')
sha512sums=('09b6c460e743bbf062c7aeeaed196834009c469d12113fdfead9a6ae30af2196a22264e8b4e7002215249bbf78ecf88c4217745ddc0c12c138dab1f744574590')
