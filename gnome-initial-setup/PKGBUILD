# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-initial-setup
pkgver=3.14.2
pkgrel=2
pkgdesc="Simple, easy, and safe way to prepare a new system"
arch=('i686' 'x86_64')
url="http://www.gnome.org/"
license=('GPL')
depends=('libnm-gtk' 'accountsservice' 'cheese' 'gnome-desktop' 'libgweather'
         'gnome-online-accounts' 'libgdm' 'libpwquality' 'libibus' 'libgnomekbd')
makedepends=('intltool')
optdepends=('gdm: GDM Initial Setup mode')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('525d4a33169e21f790d713e69318fb2226dd117b3bad571bae188f580e219eb0')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/var/lib/gnome-initial-setup"

  # Fix a warning
  chown 102:0 "$pkgdir/usr/share/polkit-1/rules.d"
  chmod 700 "$pkgdir/usr/share/polkit-1/rules.d"
}
