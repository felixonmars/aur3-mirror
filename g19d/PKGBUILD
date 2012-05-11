# Maintainer: Nuno Araujo <nuno.araujo at russo79.com>
pkgname=g19d
pkgver=0.0.10
pkgrel=3
pkgdesc="Daemon process that provides low level access to the G19 keyboard for Gnome15"
arch=(any)
url="http://www.gnome15.org/"
license=('GPL')
depends=(python2 pyusb python2-uinput0.5 python-imaging pylibg19)
source=(http://www.gnome15.org/downloads/Gnome15/Old/${pkgname}-${pkgver}.tar.gz
        g19d)
md5sums=('461b7d89244e7747c929919781548dc2'
         '763d2e25ca25e821d0dae7eef3a69c94')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # python2 fix
  for file in $(find . -type f -name '*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  sed -i 's/import uinput/import uinput0_5/' g19daemon
  sed -i 's/import uinput/import uinput0_5/' configure

  ./configure --prefix=/usr PYTHON=python2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install

  # install initscript
  install -D -m 755 "${srcdir}/g19d" "${pkgdir}/etc/rc.d/g19d"
}
# vim:set ts=2 sw=2 et:
