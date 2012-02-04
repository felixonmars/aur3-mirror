# Maintainer: Victor Blazquez Francisco <victor.blazquez at kde-espana dot es>
# Contributor: Serxio Barral <sxbarral at gmail dot com>
pkgname=tsf
pkgver=0.4.0
pkgrel=1
pkgdesc="tsf is a UNIX/Linux command tool. When invoked on a file, a copy of that file is created with a name made of the file name plus a timestamp. tsf comes handy as an easy and quick way for creating timestamped copies of files before modifying them."
arch=('x86_64' 'i686')
url="http://tsf.sourceforge.net/"
license=('GPL')
depends=('glibc')
makedepends=('gcc')
source=('http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/tsf.c')
md5sums=('2d571570c80c02160a609338fff0f198')
 
build() {
	gcc -o $srcdir/tsf $srcdir/tsf.c
}
 
package() {
	install -Dm755 $srcdir/tsf $pkgdir/usr/bin/tsf
}
