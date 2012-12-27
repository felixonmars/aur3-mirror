# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-photos
pkgver=3.7.3
pkgrel=1
pkgdesc="Access, organize and share your photos on GNOME"
arch=('i686' 'x86_64')
url="https://live.gnome.org/GnomePhotos"
license=('GPL')
depends=('clutter-gtk' 'gnome-desktop' 'gnome-online-accounts' 'librsvg' 'tracker')
makedepends=('intltool' 'gnome-common')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz
        glib-2.35.patch)
sha256sums=('6ce76e6537dad40a8b8671062d7ed4c52322f711faecb1f6b817e6c2adf458d6'
            '0b5fbbacb6aef3dbbd42fe5fabdd860179452fbd78a913801e00aed5284658db')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Revert glib 3.35 requirement
  patch -RNp1 -i "$srcdir/glib-2.35.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
