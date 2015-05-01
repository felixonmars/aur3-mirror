# $Id$
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Bob Fanger < bfanger(at)gmail >
# Contributor: Filip <fila pruda com>, Det < nimetonmaili(at)gmail >

pkgname=r8168-ck
_realname=r8168
pkgver=8.039.00
pkgrel=5
pkgdesc="A kernel module for Realtek 8168 network cards (for linux-ck kernel)"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux-ck>=4.0' 'linux-ck<4.1')
makedepends=('linux-ck-headers')
#source=(http://r8168.googlecode.com/files/$_realname-$pkgver.tar.bz2)
source=("http://r8168dl.appspot.com/files/r8168-${pkgver}.tar.bz2"
        "linux40.patch")
install=$_realname.install

_extramodules=extramodules-4.0-ck
_kernver="$(cat /lib/modules/$_extramodules/version || true)"

build() {
   cd "$srcdir/$_realname-$pkgver"
   patch -Np1 -i "$srcdir/linux40.patch"
   make -C /usr/lib/modules/$_kernver/build \
      SUBDIRS="$srcdir/$_realname-$pkgver/src" \
      EXTRA_CFAGS="-DCONFIG_R8168_NAPI -DCONFIG_R8168_VLAN" \
      modules
}

package() {
   cd "$srcdir/$_realname-$pkgver/src"
   install -D -m644 $_realname.ko "$pkgdir/usr/lib/modules/$_extramodules/$_realname.ko"
   find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
}

sha256sums=('767d922270274e781d8d42493a0021db1cafcb0388ac62564d0c0c3d82703edd'
            'e6087439b30c8f6c26113c182dd1f95044d918241b1c281b6e84b9a334e68910')
