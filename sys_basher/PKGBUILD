# Maintainer: kfgz <kfgz at interia pl>

pkgname=sys_basher
pkgver=2.0.1
pkgrel=1
pkgdesc="Multithreaded CPU, memory and disk exerciser"
arch=('i686' 'x86_64')
url="http://www.polybus.com/sys_basher_web/"
license=('custom')
makedepends=('help2man' 'lm_sensors' 'tcsh')
source=(http://www.polybus.com/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('c9f7f9aaf77b2362e49e7be68eb0f8b0')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make ${pkgname}
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}"/usr install
  install -Dm644 COPYRIGHT "${pkgdir}"/usr/share/licenses/${pkgname}/COPYRIGHT
}
