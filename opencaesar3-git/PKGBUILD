# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

_pkgname=opencaesar3
pkgname=${_pkgname}-git
pkgver=888.1a131f8
pkgrel=1
pkgdesc='Open Source implementation of Caesar III'
arch=('i686' 'x86_64')
url="https://github.com/gecube/opencaesar3"
license=('GPL3' 'BSD2')
depends=('sdl_mixer' 'sdl_ttf' 'sdl_image' 'libarchive')
makedepends=('git' 'cmake')

source=('git+https://github.com/gecube/opencaesar3.git'
	"${_pkgname}.sh")

md5sums=('SKIP'
         'c385056d9b016b67dcb9744ee7c9f482')

pkgver() {
  cd ${srcdir}/${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  cmake ./
  make
}

package() {
  cd "${srcdir}/$_pkgname"

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -r docs locale missions resources "${pkgdir}/opt/${_pkgname}"
  install -m644 'Caesar Open.ttf' "${pkgdir}/opt/${_pkgname}"
  install -m644 'DS-Greece.ttf' "${pkgdir}/opt/${_pkgname}"
  install -m755 caesar3 "${pkgdir}/opt/${_pkgname}"

  install -dm755 "${pkgdir}/opt/${_pkgname}/resources/gui"
  install -m644 models/gui/* "${pkgdir}/opt/${_pkgname}/resources/gui"

  install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -m644 INSTALL_LINUX INSTALL_WINDOWS README.md "${pkgdir}/usr/share/doc/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 LICENSE LICENSE_GPL3 "${pkgdir}/usr/share/licenses/${_pkgname}"

  install -D -m755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: set ft=sh ts=2 sw=2 et:
