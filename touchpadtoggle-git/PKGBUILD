# Maintainer: Raphael Scholer <rscholer@gmx.de>
pkgname=touchpadtoggle-git
_pkgname=touchpadtoggle
pkgver=2.1_5_g624f6e8
pkgrel=1
pkgdesc='Automatically enable/disable touchpad.'
arch=('any')
url='https://github.com/rscholer/touchpadtoggle'
license=('GPL3')
conflicts=("${_pkgname}")
makedepends=('git')
depends=('python-psutil' 'python-gobject' 'python-xdg')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "$(git describe --always |sed 's#-#_#g;s#v##')"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" prefix="/usr" install

  # Remove unneeded files
  rm -r "${pkgdir}/usr/share/doc/"
}
# vim:set ts=2 sw=2 et:
