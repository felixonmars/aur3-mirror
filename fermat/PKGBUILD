# Maintainer: perlawk

pkgname=fermat
_pkgname=ferl64
pkgver=5.17
pkgrel=2 
pkgdesc="Fermat is a computer algebra system for Macintosh, Windows, Linux, and Unix, 64bits only."
url="http://home.bway.net/lewis"
arch=( 'x86_64')
license=('unknown')
depends=()
source=( "http://home.bway.net/lewis/fermat64/ferl64.tar.gz")

package() {
	mkdir -p $pkgdir/opt
	mkdir -p $pkgdir/usr/bin
  cp -a $srcdir/$_pkgname $pkgdir/opt
	cd $pkgdir/usr/bin
  ln -s ../../opt/$_pkgname/fer64 .
}
md5sums=('d6a0edd9fa362fb4b6be4209acc33540')
