# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=bigboard
pkgver=0.6.4
pkgrel=1
pkgdesc="An experimental panel for the GNOME Desktop"
arch=('i686' 'x86_64')
url="http://live.gnome.org/OnlineDesktop/Sidebar"
license=('GPL')
depends=('online-desktop' 'hippo-canvas' 'beautiful-soup')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.6/$pkgname-$pkgver.tar.bz2)
md5sums=('37a618000cf6d17bccd1ee8857d1f564')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --disable-pymod-checks
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install || return 1
}

