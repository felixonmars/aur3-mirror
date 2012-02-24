# Maintainer: aishen944 <ashen944 'at' 163 'dot' com>

pkgname=lib32-qtwebkit
pkgver=2.2.1
pkgrel=2
pkgdesc="An open source web browser engine (Qt port)"
arch=('x86_64')
url="http://trac.webkit.org/wiki/QtWebKit"
depends=('lib32-qt' 'lib32-gstreamer0.10-base')
conflicts=('lib32-qt<4.8')
license=('LGPL')
groups=lib32
source=(http://mirrors.163.com/archlinux/extra/os/i686/qtwebkit-${pkgver}-${pkgrel}-i686.pkg.tar.xz)
sha256sums=('636329303e19fce4d8d3888a41b2dcf631d9d50b2042cedc3cfa5cfd033d0ac7')

package() {
	mkdir -p ${pkgdir}/usr/lib32
	cp -rPf ${srcdir}/usr/lib/* ${pkgdir}/usr/lib32

    # Fix pkgconfig
    sed -i "s/libdir=\${prefix}\/lib/libdir=\${prefix}\/lib32/" ${pkgdir}/usr/lib32/pkgconfig/*.pc
}
