# $Id$
# Maintainer: Tom Gundersen <teg@jklm.no>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Florian Bäuerle <florian.bae@gmail.com>

# Credits for the patch go to Vasily Khoruzhick, http://comments.gmane.org/gmane.linux.fprint/2209

pkgname=libfprint-lenovo30
pkgver=0.5.0
pkgrel=2
pkgdesc="Library for fingerprint readers, patched driver for Thinkpad T430/X230 Laptops and probably other Laptops with 147e:2020 Upek device"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=(LGPL)
provides=(libfprint)
conflicts=(libfprint)
depends=(libusb nss gdk-pixbuf2)
groups=(fprint)
options=(!libtool !emptydirs)
source=(http://people.freedesktop.org/~hadess/libfprint-$pkgver.tar.xz
        http://lists.freedesktop.org/archives/fprint/attachments/20130113/3a2df12f/attachment.obj)

build() {
  patch $srcdir/libfprint-$pkgver/libfprint/drivers/upeke2.c < $srcdir/attachment.obj
  cd "$srcdir/libfprint-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd "$srcdir/libfprint-$pkgver"
  make DESTDIR="$pkgdir" install
}
md5sums=('65d118369a47a93be623816f54cdb847'
         'bdcc792155e2d872db51c0add6457804')
