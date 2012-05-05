# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=blam
pkgver=1.8.9
pkgrel=3
pkgdesc="A simple newsreader for GNOME"
arch=('any')
url="http://blam.relatitude.org/"
license=('GPL')
depends=('webkit-sharp' 'gconf-sharp' 'notify-sharp' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool')
install=$pkgname.install
source=(http://blam.relatitude.org/download/$pkgname-$pkgver.tar.bz2
        blam-mono-2.10.patch
        drop-gnome-sharp-dependency.patch
        fix-save.patch)
md5sums=('3ce13cf7c78e9c4fbd746e96e81e3ae9'
         '87efd34e5f136d4c740d2fd22b8f0314'
         '7659a3918cc6a69a2333091071867215'
         'aa870db4fc2e974c8b600ed4ed03c1a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/blam-mono-2.10.patch"

  # https://bugzilla.gnome.org/show_bug.cgi?id=675530
  patch -Np1 -i "$srcdir/drop-gnome-sharp-dependency.patch"

  # https://bugzilla.gnome.org/show_bug.cgi?id=675531
  patch -Np1 -i "$srcdir/fix-save.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
