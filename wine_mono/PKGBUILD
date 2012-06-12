# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>


pkgname=wine_mono
_pkgname=wine-mono
pkgver=0.0.4
pkgrel=1
pkgdesc="Wine's built-in replacement for the .NET Framework"
arch=('any')
url="http://wiki.winehq.org/Mono"
license=('LGPL')
depends=('wine>=1.5.6')
provides=('wine-mono')
conflicts=('wine-mono')
source=("http://sourceforge.net/projects/wine/files/Wine%20Mono/0.0.4/${_pkgname}-${pkgver}.msi")
md5sums=('972b4e96e677c2cf5065fbdd13183c66')


package() {
  cd "${srcdir}"
  _monodir="${pkgdir}/usr/share/wine/mono"
  install -Dm644 "${_pkgname}-${pkgver}.msi" "${_monodir}/${_pkgname}-${pkgver}.msi"
}

# vim:set ts=2 sw=2 et:
