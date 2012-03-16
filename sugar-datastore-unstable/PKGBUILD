# Maintainer: Xin Wang <dram.wang@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-datastore-unstable
_realname=${pkgname%-unstable}
pkgver=0.95.2
pkgrel=1
pkgdesc="Backend of the Sugar Journal"
arch=('i686' 'x86_64')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
conflicts=('sugar-datastore')
depends=('python2' 'dbus-python' 'pygobject' 'sugar-base-unstable' 'python2-xapian' 'python-cjson')
makedepends=('gcc')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${_realname}/${_realname}-${pkgver}.tar.bz2)
md5sums=('869cae187e5dd3c9dd0e5eab1aff8859')


build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # python2 fix
  for file in copy-from-journal copy-to-journal datastore-service; do
        sed -i 's_^python_python2_' ${pkgdir}/usr/bin/${file}
        sed -i 's_^#!/usr/bin/env python_#!/usr/bin/env python2_' ${pkgdir}/usr/bin/${file}
  done
}


