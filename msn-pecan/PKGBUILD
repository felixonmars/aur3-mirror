# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor:  Stefan Wilkens <stefanwilkens@gmail.com>
 
pkgname=msn-pecan
pkgver=0.1.4
pkgrel=1
pkgdesc="A fork of the MSN protocol plugin for libpurple (Pidgin/Finch/Adium/haze)."
arch=('i686' 'x86_64')
url="http://code.google.com/p/msn-pecan/"
license=('GPL')
depends=('libpurple')
source=("http://msn-pecan.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
md5sums=('2f7f08a0276b82f4dffce34cac32cab8')
 
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install install_locales
}
 
# vim:set ts=2 sw=2 et: