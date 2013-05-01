# Contributor: Raphael Scholer <rscholer@gmx.de>

_pkgname=LightRead
pkgname=lightread-git
pkgver=163.a745330
pkgrel=1
pkgdesc="A Google Reader"
arch=('any')
url="https://github.com/stayradiated/LightRead"
license=('custom')
depends=( 'pygtk' 'python2' 'python2-gobject' 'pywebkitgtk' \
          'python2-notify' 'libwebkit3' 'hicolor-icon-theme')
optdepends=('libdbusmenu: Unity support')
makedepends=('git' 'python2-distutils-extra')
conflicts=('lightread')
install=lightread-git.install
source=('git://github.com/stayradiated/LightRead.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_pkgname}"

  sh ./compile.sh
}

package() {
  cd "${srcdir}/${_pkgname}/Ubuntu"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -m 644 -D "COPYING" \
    "${pkgdir}/usr/share/licenses/lightread-git/license.txt"

  # Icon fix
  ln -s "/usr/share/icons/hicolor/128x128/apps/lightread.png" \
    "${pkgdir}/usr/share/lightread/media/lightread.png"
}

# vim:set ts=2 sw=2 et:
