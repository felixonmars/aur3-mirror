# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=libbulletml
pkgver=0.0.6
pkgrel=4
pkgdesc="A "bullet" library underlying many of Kenta Cho's games"
arch=('i686' 'x86_64')
url="http://shinh.skr.jp/"
license=('custom')
makedepends=('bison' 'gcc' 'boost')
depends=('gcc-libs')
source=(http://ftp.de.debian.org/debian/pool/main/b/bulletml/bulletml_0.0.6.orig.tar.gz
        http://ftp.de.debian.org/debian/pool/main/b/bulletml/bulletml_0.0.6-4.diff.gz
	fpic-libbulletml.patch
	calc.patch)
md5sums=('b34aec521fd0762000f2d75518b1aefc'
         'cd629345e61b827caed8bea8dde68ae6'
         '3d0ff9e7d8a9d6a8fadd8fad3f75363a'
         '865b08f90d38ac874271ff3453f2da40')
 
build() {
 
# Patching
cd $srcdir/bulletml
patch -Np1 <../bulletml_0.0.6-4.diff
while read x; do patch -p1 <debian/patches/"$x"; done <debian/patches/series
patch -Np1 <../fpic-libbulletml.patch
patch -Np0 <../calc.patch

# Building
cd src
make || return 1

# Installing

mkdir -p $pkgdir/usr/{include,include/bulletml/tinyxml/,include/d/,lib,share/doc/bulletml/sample}
install -D -m644 $srcdir/bulletml/src/bulletml.d $pkgdir/usr/include/d/
install -D -m644 $srcdir/bulletml/src/*.h $pkgdir/usr/include/bulletml/
install -D -m644 $srcdir/bulletml/src/tinyxml/*.h $pkgdir/usr/include/bulletml/tinyxml/
install -D -m644 $srcdir/bulletml/src/lib*.a $pkgdir/usr/lib/
install -D -m644 $srcdir/bulletml/src/lib*.so $pkgdir/usr/lib/
install -D -m644 $srcdir/bulletml/debian/doc/{*.dtd,*.rlx,*.html,*.txt} $pkgdir/usr/share/doc/bulletml
install -D -m644 $srcdir/bulletml/debian/doc/sample/* $pkgdir/usr/share/doc/bulletml/sample
install -D -m644 $srcdir/bulletml/debian/copyright $pkgdir/usr/share/licenses/libbulletml/copyright

}
