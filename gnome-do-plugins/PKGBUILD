# $Id: PKGBUILD 128253 2015-02-26 13:12:24Z jgc $
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Doehni <dohny@gmx.de>

pkgname=gnome-do-plugins
pkgver=0.8.5
pkgrel=3
pkgdesc="Plugins for gnome-do"
arch=('any')
url="http://do.cooperteam.net/"
license=('GPL3')
depends=('gnome-do' 'flickrnet' 'gdata-sharp' 'gnome-vfs-sharp' 'wnck-sharp')
makedepends=('intltool')
source=(http://launchpad.net/do-plugins/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz
        use_dbussharp_2.patch
        flickrnet-3.2.patch)
md5sums=('022d184e884cabd3078716385f123c0a'
         'bf39bfb9f33f258938bcdf182a3a53a5'
         '8222b36baf39657d8f4e4c214f124093')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Port to FlickrNet 3.2
  patch -Np1 -i "$srcdir/flickrnet-3.2.patch"

  # Port to dbus-sharp-2
  patch -Np1 -i ../use_dbussharp_2.patch

  # Remove some unused dependencies
  sed -i '/gnome-desktop-sharp/d
          /gnome-sharp/d' configure.ac

  # Remove some plugins
  sed -i '/AptURL/d
          /Transmission/d' Makefile.am
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi
  ./configure --prefix=/usr --enable-release
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
