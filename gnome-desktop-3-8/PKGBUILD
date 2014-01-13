# Maintainer: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=gnome-desktop-3-8
_realpkg=gnome-desktop
pkgver=3.8.2
pkgrel=1
pkgdesc="Library with common API for various GNOME modules, version 3.8.x"
arch=(i686 x86_64)
license=(GPL LGPL)
depends=(gsettings-desktop-schemas gtk3 libxkbfile xkeyboard-config iso-codes)
makedepends=(intltool gobject-introspection itstool)
url="http://www.gnome.org"
groups=(gnome)
conflicts=('gnome-desktop')
provides=('gnome-desktop' "gnome-desktop=$pkgver")
source=(http://ftp.gnome.org/pub/gnome/sources/$_realpkg/${pkgver%.*}/$_realpkg-$pkgver.tar.xz)
sha256sums=('af4ec330fa61ee761daf2d5e481e2f9ffbd068d135d5e31a3eaf274524cba33d')

build() {
  cd $_realpkg-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$_realpkg --disable-static \
    --with-gnome-distributor="Arch Linux"
  make
}

package() {
  cd $_realpkg-$pkgver
  make DESTDIR="$pkgdir" install
}
