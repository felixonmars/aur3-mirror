# Maintainer: Michele Damiano Torelli <me_AT_mdtorelli_DOT_it>

pkgname=playframework2-devel-extras
pkgver=2.2.3rc1
_pkgver=2.2.3
_develver=RC1
pkgrel=1
arch=('any')
url="http://www.playframework.org/"
license=('Apache')
pkgdesc="Extra contents (documentation, samples, ...) for Play Framework 2 - Development version"
depends=('playframework2-devel>=2.2.3rc1')
source=("http://downloads.typesafe.com/play/${_pkgver}-${_develver}/play-${_pkgver}-${_develver}.zip")
sha1sums=('0c138469a85de56e1f2a288568c793ff2fbc57a3')

package() {
  install -dm755 "${pkgdir}"/usr/share/playframework2
  cp -r play-${_pkgver}-${_develver}/samples "${pkgdir}"/usr/share/playframework2
  cp play-${_pkgver}-${_develver}/{README.md,CONTRIBUTING.md} "${pkgdir}"/usr/share/playframework2
}

