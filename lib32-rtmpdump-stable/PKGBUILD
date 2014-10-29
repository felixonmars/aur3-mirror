_pkgname=rtmpdump
pkgname=lib32-${_pkgname}
pkgver=2.3
pkgrel=1
pkgdesc="A tool to download rtmp streams (32 bit)"
arch=('x86_64')
url="http://rtmpdump.mplayerhq.hu/"
license=('GPL2' 'LGPL2.1')
depends=('lib32-openssl' "${_pkgname}")
options=('!makeflags')
source=(http://rtmpdump.mplayerhq.hu/download/${_pkgname}-${pkgver}.tgz)
sha1sums=('b65ce7708ae79adb51d1f43dd0b6d987076d7c42')
options=(!makeflags)

prepare() {
cd ${srcdir}/${_pkgname}-${pkgver}
sed -i -e 's:gcc:gcc -m32:' Makefile librtmp/Makefile
}

build() {
cd ${srcdir}/${_pkgname}-${pkgver}
make OPT="$CFLAGS" XLDFLAGS="$LDFLAGS"
}

package() {
cd ${srcdir}/${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
}

