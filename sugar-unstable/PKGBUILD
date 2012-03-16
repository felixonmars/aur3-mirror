# Maintainer: Xin Wang <dram.wang@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-unstable
_realname=${pkgname%-unstable}
pkgver=0.95.5
pkgrel=1
pkgdesc="Sugar is the core component of a worldwide effort to provide every child with equal opportunity for a quality education"
arch=('i686' 'x86_64')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
conflicts=('sugar')
depends=('python2' 'gtk2' 'telepathy-mission-control' 'python-simplejson' 'python-wnck' 'sugar-datastore-unstable' 'sugar-artwork-unstable' 'sugar-toolkit-unstable' 'sugar-toolkit-gtk3-unstable' 'metacity' 'python2-dateutil')
makedepends=('gcc' 'perl>=5.8.1')
optdepends=('xorg-server-xephyr: Needed for sugar-emulator')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${_realname}/${_realname}-${pkgver}.tar.bz2)
md5sums=('8ec432a4bfd0a37db198feca5246c8ff')


build() {
  cd "${srcdir}/${_realname}-${pkgver}"

  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # python2 fix (taken from pyrss PKGBUILD, modified a bit)
  for file in $(find ${pkgdir}/usr/bin -name 'sugar*'); do
        sed -i 's_^python_python2_' $file
        sed -i 's_^#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done
}



