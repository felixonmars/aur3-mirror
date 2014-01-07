# You need to manualy download from http://www.jboss.org/products/fuse as the 
# download requires registration.

pkgname=fuseide
pkgver=6.0.0.129
pkgrel=1
pkgdesc="Developer Tooling for Apache Camel, ServiceMix, and ActiveMQ"
arch=('i686' 'x86_64')
url="http://www.jboss.org/products/fuse"
license=('﻿Fuse IDE User License Agreement')
depends=()
source=(fuseide.desktop)
sha256sums=(b79a31de54b318be94c7cf74af91091610b179c14161e0bdf9732a79898c55e9)
if test "$CARCH" == i686; then
  source+=("FuseIDE-$pkgver-linux.gtk.x86.zip")
  sha256sums+=("7a3120cc66dea7dc95a93a6f0c57ca10ac026edc184d45bb6a86a841eb0fa99f")
fi

if test "$CARCH" == x86_64; then
  source+=("FuseIDE-$pkgver-linux.gtk.x86_64.zip")
  sha256sums+=("c90fe71dbd0c45a1f80e27b0e30315969ce29eaf0c0ecf34d1b4bde95c049ed7")
fi

package() {
        install -Ddm755 "${pkgdir}/opt/"
	cp -r "$srcdir/FuseIDE-6.0.0" "${pkgdir}/opt/FuseIDE"
        install -Ddm755 "${pkgdir}/usr/share/applications/"
	cp "$srcdir/fuseide.desktop" "${pkgdir}/usr/share/applications/"
}
