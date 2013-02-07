

# Maintainer: Giordano Ricci <grdnricci@gmail.com>
pkgname=mate-window-applets
pkgver=0.2.10
pkgrel=1
pkgdesc="Window buttons and title applets for mate-panel"
arch=('x86' 'x86_64')
url="http://gnome-look.org/content/show.php?content=103732"
license=('GPL')
depends=('mate-panel' 'libmatecomponent')
install=.install
source=('https://www.dropbox.com/s/bqpnx024eylsrzs/mate-window-applets-0.2.10.tar.gz?dl=1' 'https://www.dropbox.com/s/8lklrzxzql4vbmy/configure.patch?dl=1')
md5sums=('3b1438e76e9a3220af623989afb8d78d'
         '1f0f8de835c47854889c350efc846689')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch configure ../configure.patch?dl=1
  ./configure --prefix=/usr --libexec=/usr/lib/$pkgname --sysconfdir=/etc --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
