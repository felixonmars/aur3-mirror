# $Id: PKGBUILD 9477 2010-01-25 16:19:56Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=xf4vnc-xvnc
pkgver=4.3.0.999
pkgrel=1
pkgdesc="xf4vnc Xvnc server"
arch=(i686 x86_64)
url="http://xf4vnc.sf.net"
license=('GPL')
depends=(bzip2 freetype2 libxdmcp libxau libx11 libxext libxaw libxmu
		libxt libsm libice libxpm libjpeg6 libxcb)
[ $CARCH == x86_64 ] && depends=(lib32-bzip2 lib32-freetype2 lib32-glibc lib32-libxdmcp lib32-libxau lib32-libx11
	lib32-libxext lib32-libxaw lib32-libxmu lib32-libxt lib32-libsm lib32-libice lib32-libxpm lib32-libjpeg6
	lib32-libxcb)
conflicts=(tightvnc)
options=('!libtool')
source=("xf4vnc-ix86-linux-${pkgver}.tar.gz::http://downloads.sourceforge.net/project/xf4vnc/xf4vnc-linux-i386/${pkgver}/xf4vnc-ix86-linux-${pkgver}.tar.gz?&use_mirror=surfnet")
md5sums=('f6b4216439b36b17c6231e2422e391a5')

build() {
	true
}

package() {
	cd "$srcdir/xf4vnc-4.3.0.999"
	if [ $CARCH == x86_64 ] ; then
		mkdir -p "$pkgdir/usr/lib32"
		cp *.so "$pkgdir/usr/lib32"
	else
		mkdir -p "$pkgdir/usr/lib"
		cp *.so "$pkgdir/usr/lib"
	fi
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/include"
	cp *.h "$pkgdir/usr/include"
	cp Xvnc vncevent vncviewer "$pkgdir/usr/bin"
}
