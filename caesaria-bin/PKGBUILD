# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

_pkgname=caesaria
pkgname=${_pkgname}-bin
pkgver=28012014
pkgrel=1
pkgdesc='Open Source implementation of Caesar III'
arch=('i686' 'x86_64')
url="https://bitbucket.org/dalerank/caesaria/issues"
license=(custom)

if [ "$CARCH" == "i686" ]; then
  depends=('sdl_mixer' 'sdl_ttf' 'sdl_image')
else
  depends=('lib32-sdl_mixer' 'lib32-sdl_ttf' 'lib32-sdl_image')
fi

source=("http://downloads.sourceforge.net/sourceforge/opencaesar3/${_pkgname}-${pkgver}%28win%2Clinux%29.zip"
	"${_pkgname}.sh")

md5sums=('7841b80d0c50b99946d7dc1780685af9'
         '7fb77f6ac4d877ded7e17cccec97c3e5')

package() {
  cd "${srcdir}/${_pkgname}-test"

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -r resources "${pkgdir}/opt/${_pkgname}"

  install -m644 stable_info.txt version_info.txt "${pkgdir}/opt/${_pkgname}"
  install -m755 caesaria.linux "${pkgdir}/opt/${_pkgname}"

  install -D -m755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: set ft=sh ts=2 sw=2 et:
