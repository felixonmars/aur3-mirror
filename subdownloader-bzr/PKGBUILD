# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Thomas Jost <thomas.jost@gmail.com>
# Contributor: Hugo Barros <kuvalski@gmail.com>
# Contributor: Changaco <changaco ατ changaco δοτ net>
# Contributor: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Arthur Țițeică arthur.titeica/gmail/com

pkgname=subdownloader-bzr
_pkgname=subdownloader
pkgver=556
pkgrel=1
epoch=1
pkgdesc="Automatic download/upload of subtitles using fast hashing (Development version)."
arch=('any')
url="http://www.subdownloader.net/"
license=('GPL3')
depends=('python2-pyqt' 'imdbpy' 'kaa-metadata' 'desktop-file-utils')
makedepends=('bzr')
provides=('subdownloader')
conflicts=('subdownloader')
source=("bzr+https://code.launchpad.net/subdownloader/trunk")
md5sums=('SKIP')
install=${_pkgname}.install

pkgver() {
  cd trunk
  bzr revno
}

prepare() {
  cd trunk
  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd trunk
  # prepare dirs
  install -d "${pkgdir}/usr/share/${_pkgname}" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/man/man1/"

  # manual
  install -D -m644 subdownloader.1 "${pkgdir}/usr/share/man/man1/"

  # freedesktop.org
  install -D -m644 subdownloader.desktop \
    "${pkgdir}/usr/share/applications/subdownloader.desktop"

  # runtime and executables
  cp -a * "${pkgdir}/usr/share/${_pkgname}/"
  chmod 755 "${pkgdir}/usr/share/${_pkgname}/run.py"
  ln -s "/usr/share/${_pkgname}/run.py" \
    "${pkgdir}/usr/bin/subdownloader"

  install -D -m644 gui/images/subdownloader.png \
    "${pkgdir}/usr/share/pixmaps/subdownloader.png"

  # languages
  mv "${pkgdir}/usr/share/${_pkgname}/locale/" "${pkgdir}/usr/share/locale/"

  # unnecessary stuff
  cd "${pkgdir}/usr/share/${_pkgname}"
  rm -r distribution

  find "${pkgdir}/usr/share/locale" -type f -name '*.po' \
      -exec rm {} +

  rm -r "${pkgdir}/usr/share/locale/subdownloader.pot"
  rm subdownloader.1 subdownloader.desktop
}
