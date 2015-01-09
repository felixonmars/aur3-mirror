# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-characters
pkgver=3.15.2
pkgrel=1
pkgdesc="Character map application for GNOME"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Design/Apps/CharacterMap"
license=('GPL')
depends=('gjs' 'gtk3' 'libunistring' 'gnome-icon-theme')
makedepends=('intltool' 'python2')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('aa4870cb1a8e725f409565ec50094a284ea903da14945a725e663392d72bfbe3')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
