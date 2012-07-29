# Maintainer: Spike29 <leguen.yannick@gmail.com>

_pkg=qxmpp
pkgname=qxmpp-wilink
pkgver=0.5.0
pkgrel=1
pkgdesc='An XMPP client library based on Qt & C++ (wiLink suitable version)'
arch=('i686' 'x86_64')
url='http://code.google.com/p/qxmpp/'
license=('LGPL 2.1')
depends=('qt>=4.5' 'speex' 'libvpx' 'libtheora')
conflicts=('qxmpp' 'qxmpp-git' 'qxmpp-leechcraft' 'qxmpp-leechcraft-git')
source=("http://qxmpp.googlecode.com/files/${_pkg}-${pkgver}.tar.gz")
sha1sums=('b418045e0d068ab45a1d557ce52922ffb50852d1')
 
build() {
	cd "$srcdir/$_pkg-$pkgver/"
	[ -d build ] || mkdir build && cd build
	qmake PREFIX=/usr QXMPP_USE_SPEEX=1 \
	QXMPP_USE_VPX=1 QXMPP_USE_THEORA=1 ..
	make
}

package() {
	cd "$srcdir/$_pkg-$pkgver/build"
	make INSTALL_ROOT="$pkgdir" install
}
