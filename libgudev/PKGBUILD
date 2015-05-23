# Maintainer: David Herrmann <dh.herrmann@gmail.com>

pkgname=libgudev
pkgver=219
pkgrel=1
pkgdesc="UDev GObject bindings"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://wiki.gnome.org/Projects/libgudev"
depends=('libsystemd>=199' 'glib2>=2.22.0')
makedepends=('gobject-introspection')
conflicts=('libsystemd' 'systemd-git')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz)
#source=($pkgname-$pkgver.tar.xz)
sha256sums=('7684f5de321d1d231c93d3467acd8ac21f886173f46171829720f61fd0a8c9de')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-gtk-doc
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
