# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=indicator-network
pkgver=0.3.8
pkgrel=2
pkgdesc="Network Menu for controlling network connections. Uses Connection Manager."
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-network"
license=('GPL')
depends=('libindicator3>=0.3.0' 'libdbusmenu-gtk3>=0.3.90' 'libnotify>=0.7.1' 'libgee' 'connman' 'dbus-python' 'pygtk' 'mobile-broadband-provider-info' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool>=0.35.0' 'vala')
options=(!libtool)
install=$pkgname.install
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz
        generate_vapi.patch
        gtk3-vala-port.patch)
md5sums=('70ebd79a1087981adacf3107a17136af'
         '5540bbcba5b1fd83fd47f4e5424830d5'
         '4a74a47545b56b7b093730073739aba7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's@^#!.*python$@#!/usr/bin/python2@'  scripts/*
  patch -Np1 -i "$srcdir/generate_vapi.patch"
  patch -Np1 -i "$srcdir/gtk3-vala-port.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
