# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=libbtctl
pkgver=0.11.1
pkgrel=1
pkgdesc="GObject wrapper for Bluetooth functionality."
arch=('i686' 'x86_64')
url="http://www.usefulinc.com/software/gnome-bluetooth/"
license=('GPL' 'LGPL')
depends=('glib2' 'openobex' 'bluez')
makedepends=('intltool' 'python' 'gtk2')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/0.11/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5b5ab9e71dd5428c4e5c45cbf581a384')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-gtk-doc \
    --disable-mono --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
