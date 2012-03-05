# Maintainer: György Balló <ballogy@freestart.hu>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Doehni <dohny@gmx.de>

pkgname=gnome-do
pkgver=0.9
pkgrel=1
pkgdesc="A launcher application for gnome (like Launchy or Katapult)"
arch=('i686' 'x86_64')
url="http://do.davebsd.com/"
license=('GPL3')
depends=('gconf-sharp' 'libgnome-desktop-sharp' 'gnome-keyring-sharp' 'mono-addins' 'notify-sharp' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'libgnome-sharp' 'gio-sharp')
options=('!libtool')
install=$pkgname.install
source=(http://launchpad.net/do/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz
        remove-unused-dependencies.patch
        use-gio-sharp.patch
        use-gnome-desktop.patch)
md5sums=('d360e56953915d9585c0ee71f433129c'
         '4d162279d9a4bcb076c93d89aaf40588'
         '4a9c7eb15bfa2b19104b1d5ccd6467a9'
         'd33001a70a483925ae41861360eae71e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/use-gio-sharp.patch"
  patch -Np1 -i "$srcdir/use-gnome-desktop.patch"
  patch -Np1 -i "$srcdir/remove-unused-dependencies.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc \
              --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
