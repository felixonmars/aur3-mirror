# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=libcryptui
pkgver=3.2.2
pkgrel=1
pkgdesc="Library for OpenPGP prompts"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/libcryptui/"
license=('GPL')
depends=('gtk3' 'gpgme' 'dbus-glib' 'libnotify' 'libgnome-keyring' 'dconf')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/3.2/$pkgname-$pkgver.tar.xz)
sha256sums=('76123c9d3ccdefc94f55b1726f1084a48a1a8c792ee641a39d415142fe4ac4eb')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
