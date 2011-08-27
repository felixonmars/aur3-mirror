# Contributor: Yannick Poirier <contact@yannickpoirier.fr>
pkgname=tiniant
pkgver=1.2.0
pkgrel=4
pkgdesc="TiniAnt is an extension to Ant that simplifies building applications for the TINI, in a cross-platform manner"
arch=('i686')
url="http://tiniant.sourceforge.net/"
license=("TiniAnt")
groups=()
depends=(apache-ant tini)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=("http://prdownloads.sourceforge.net/tiniant/${pkgname}-1_2_0.tgz")
noextract=()
md5sums=(978e3f00ba62c6ee3a5c9942ef965312) 

_pkgver=1_2_0

build() {
	cd $srcdir/${pkgname}-1_2_0/ || return 1
	ant || return 1

	install -v -d "$pkgdir/usr/share/java/apache-ant/lib" || return 1
	install -v -d "$pkgdir/usr/share/$pkgname" || return 1
	install -v -d "$pkgdir/usr/share/licenses/$pkgname" || return 1

	install -D -m644 $srcdir/${pkgname}-${_pkgver}/lib/*.jar "$pkgdir/usr/share/java/apache-ant/lib/"  || return 1
	install -D -m644 $srcdir/${pkgname}-${_pkgver}/doc/copying/index.html "$pkgdir/usr/share/licenses/$pkgname"  || return 1

	cp -r  $srcdir/${pkgname}-${_pkgver}/doc "$pkgdir/usr/share/$pkgname"  || return 1
	cp -r  $srcdir/${pkgname}-${_pkgver}/examples "$pkgdir/usr/share/$pkgname"  || return 1

}



