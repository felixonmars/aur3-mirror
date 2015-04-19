# Maintainer: perlawk

pkgname=fermat-32
_pkgname=fermat
pkgver=3.9.9i
pkgrel=2 
pkgdesc="Fermat is a computer algebra system for Macintosh, Windows, Linux, and Unix, it is old version for compatible with 32bit machine."
url="http://home.bway.net/lewis"
arch=(any)
license=('unknown')
depends=()
source=( "http://www.bway.net/~lewis/latest/fermat.tar.gz")

package() {
	mkdir -p $pkgdir/opt
	mkdir -p $pkgdir/usr/bin
  cp -a $srcdir/$_pkgname $pkgdir/opt
	cd $pkgdir/usr/bin
  ln -s ../../opt/$_pkgname/ferl .
}
md5sums=('7cdc6cf5a3685bfaee763e2e93a073d1')
