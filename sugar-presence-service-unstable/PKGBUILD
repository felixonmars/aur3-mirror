# Maintainer: Xin Wang <dram.wang@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-presence-service-unstable
_realname=${pkgname%-unstable}
pkgver=0.90.2
pkgrel=1
pkgdesc="Interfaces between Sugar and Telepathy Connection Managers"
arch=('i686' 'x86_64')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
conflicts=('sugar-presence-service')
depends=('python2' 'sugar-base-unstable' 'python-telepathy' 'gnome-python')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${_realname}/${_realname}-${pkgver}.tar.bz2)
md5sums=('bb53b4dc20e81697deb5124fc2cd0fc6')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # python2 fix
  for file in sugar-presence-service; do
        sed -i 's_^python_python2_' ${pkgdir}/usr/bin/${file}
        sed -i 's_^#!/usr/bin/env python_#!/usr/bin/env python2_' ${pkgdir}/usr/bin/${file}
  done

}


