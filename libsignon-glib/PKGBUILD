# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgname=libsignon-glib
pkgver=1.12
pkgrel=1
pkgdesc='GLib-based client library for applications handling account authentication through the Online Accounts Single Sign-On service'
arch=('i686' 'x86_64')
url='https://01.org/gsso'
license=('LGPL2.1')
depends=('signon')
makedepends=('python2-gobject')
source=("git+https://gitlab.com/accounts-sso/libsignon-glib.git#commit=11033f3e")
sha256sums=('SKIP')

build() {
  cd libsignon-glib

  export PYTHON='/usr/bin/python2'

  ./autogen.sh \
    --prefix='/usr' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --disable-static
  make -j1
}

package() {
  cd libsignon-glib

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
