# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=phonetooth
pkgver=0.5.1
pkgrel=5
pkgdesc="Send text messages with and files to a mobile phone through a bluetooth connection."
arch=('i686' 'x86_64')
url="http://code.google.com/p/phonetooth/"
license=('GPL2')
depends=('bluez' 'dbus-python' 'obex-data-server' 'pygtk' 'python-pybluez' 'python-pyserial')
optdepends=('python-gammu: to use the gammu backend')
install=$pkgname.install
source=(http://phonetooth.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('9acded96a515bbcf11ca09ec24995715')
sha256sums=('5c38d03341943b4dc53d1e30fbe955b14eccc594b83a9e25441de40fa53533d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PYTHON=python2 ./configure --prefix=/usr
  
  make
  make DESTDIR="$pkgdir" install
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" ${pkgdir}/usr/bin/phonetoothui
}
# vim:set ts=2 sw=2 et:
