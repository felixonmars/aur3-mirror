# Maintainer: Kin <kurisui at gmail dot com>
pkgname=znc-notify
pkgver=1838
pkgrel=1
pkgdesc='A module to show notices/messages when users detach/attach which include their ip addresses.'
arch=(i686 x86_64)
url=http://en.znc.in/wiki/Notify
license=(custom)
depends=(gcc-libs perl openssl c-ares tcl znc)
makedepends=(perl openssl gcc pkgconfig tcl grep znc)
source=('http://blueman.tuxfamily.org/notify.cpp')
md5sums=('dbcbb031809fe1f58792f73ce5777549')
build() {

 znc-buildmod notify.cpp || return 1
 mkdir -p $pkgdir/usr/lib/znc || return 1
 mv *.so $pkgdir/usr/lib/znc || return 1

}
