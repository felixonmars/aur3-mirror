# Maintainer : GordonGR <ntheo1979@gmail.com>

pkgname=lib32-x264
_pkgname=x264
pkgver=142.20140311
pkgrel=3
epoch=1
pkgdesc="Free library for encoding H264/AVC video streams, lib32"
arch=('x86_64')
url="http://www.videolan.org/developers/x264.html"
license=('GPL')
depends=("${_pkgname}")
source=("ftp://ftp.archlinux.org/extra/os/i686/${_pkgname}-${epoch}:${pkgver}-${pkgrel}-i686.pkg.tar.xz")
md5sums=('f5655b1ff7a70a4c77fddcd6a63e2a44')

package() {
cd ${srcdir}
  
install -dm755 $pkgdir/usr/lib32/
cp -R $srcdir/usr/lib/*.so* $pkgdir/usr/lib32/
}
