# Maintainer: Xin Wang <dram.wang@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-toolkit-unstable
_realname=${pkgname%-unstable}
pkgver=0.95.4
pkgrel=1
pkgdesc="Set of widgets for Sugar applications"
arch=('i686' 'x86_64')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
conflicts=('sugar-toolkit')
depends=('python2' 'sugar-datastore-unstable' 'sugar-presence-service-unstable' 'hippo-canvas' 'alsa-lib' 'python2-gconf' 'python-rsvg')
makedepends=('intltool>=0.33' 'gcc' 'perl>=5.8.1')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${_realname}/${_realname}-${pkgver}.tar.bz2)
md5sums=('08f5293fe26c9f9a9d392f851bc92605')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


