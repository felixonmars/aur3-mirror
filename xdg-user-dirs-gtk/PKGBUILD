# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=xdg-user-dirs-gtk
pkgver=0.8
pkgrel=3
pkgdesc="A companion to xdg-user-dirs that integrates it into the Gnome desktop and Gtk+ applications"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/xdg-user-dirs-gtk/"
license=('GPL')
depends=('gtk2' 'xdg-user-dirs')
makedepends=('intltool>=0.35.0')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('971e5cd121606c437c2b07e189c8f34791ae0c4d81e155266d71acc7b263ad32')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
