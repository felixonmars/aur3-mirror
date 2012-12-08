# Maintainer: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=xf86-video-intel-plymouth
_pkgname=xf86-video-intel
pkgver=2.16.0
pkgrel=1
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers"
arch=('any')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('intel-dri' 'libxvmc' 'libpciaccess' 'libdrm' 'xcb-util' 'libxfixes' 'udev')
makedepends=('xorg-server-devel' 'libx11' 'libdrm' 'xf86driproto' 'glproto' 'mesa' 'libxvmc' 'xcb-util')
conflicts=('xorg-server<1.10.0' 'xf86-video-i810' 'xf86-video-intel-legacy' 'xf86-video-intel')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
provides=(xf86-video-intel=$pkgver)
source=($url/releases/individual/driver/$_pkgname-$pkgver.tar.bz2
        101_copy-fb.patch
        120_check_privates.patch)
sha1sums=('53441ea4d4335b501d32809b6b92593cbb1f79cf'
          '6873bf49ef3b7f8b7699f2eee64bc85e8e97a245'
          '412d18569045a3ce98d2edd77fe06772e5421ccf')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i "$srcdir/101_copy-fb.patch"
  patch -Np1 -i "$srcdir/120_check_privates.patch"

  autoreconf
  ./configure --prefix=/usr --enable-dri
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
