# $Id$
# Based on:  Ionut Biru <ibiru@archlinux.org>
# Contributor: Ju Liu <liuju86 at gmail dot com>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Andreas Zwinkau <beza1e1@web.de>
# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
pkgname=telepathy-mission-control-wout-gnome
_pkgname=telepathy-mission-control
pkgver=5.11.0
pkgrel=1
pkgdesc="A Telepathy component providing abstraction of some of the details of connection managers. WITHOUT GNOME"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org/wiki/Mission Control"
license=('LGPL2.1')
depends=('telepathy-glib' 'upower' 'dconf')
makedepends=('libxslt' 'python2')
provides=('telepathy-mission-control')
install=telepathy-mission-control.install
options=('!libtool')
source=(http://telepathy.freedesktop.org/releases/telepathy-mission-control/$_pkgname-$pkgver.tar.gz)
md5sums=('f7503d52cb432e03ba7b4ad5bb6165c6')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
   #FIX to use really python2
   rm -rf "${srcdir}"/python
   mkdir "${srcdir}"/python
   ln -s /usr/bin/python2 "${srcdir}"/python/python
   export PATH="${srcdir}"/python:$PATH
    ./configure --prefix=/usr \
    --libexecdir=/usr/lib/telepathy \
    --disable-schemas-compile
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
