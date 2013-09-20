# Maintainer: mortdeus <mortdeus@gocos2d.org>
pkgname=xf86-video-wayland-git

pkgver=0.4.0
pkgrel=1
pkgdesc="Generic driver for hosting Xorg inside a Wayland compositor"

arch=('i686' 'x86_64')
url="http://wayland.freedesktop.org/"
license=('MIT')
provides='xf86-video-wayland'

makedepends=('wayland-git' 'xorg-server-xwayland' 'xproto')
conflicts=('xf86-video-wayland')
options=('!libtool')
source=("git+git://anongit.freedesktop.org/xorg/driver/xf86-video-wayland")

sha256sums=('SKIP')

build() {
  cd $srcdir/xf86-video-wayland
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc/X11 --localstatedir=/var 
  make
}
package() {
   cd $srcdir/xf86-video-wayland
   make prefix=$pkgdir/usr install

   install -m755 -d "$pkgdir/usr/share/licenses/xf86-video-wayland"
   install -m644 COPYING "$pkgdir/usr/share/licenses/xf86-video-wayland"
  

}

