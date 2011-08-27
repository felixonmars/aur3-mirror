# Maintainer: nem <nem at ikitten dot co dot uk>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=musca-fixed
_binaryname=musca
pkgver=0.9.24
pkgrel=1
pkgdesc='musca wm - with a patchset fixing a few common bugs'
arch=('i686' 'x86_64')
url='http://aerosuidae.net/musca/'
license=('GPL3')
depends=('libx11' 'dmenu')
conflicts=('musca')
source=("http://aerosuidae.net/${_binaryname}-${pkgver}.tgz"
	"0001-fix-dmenu.patch"
	"0002-fix-cycle.patch"
	"0003-fix-pad.patch")
md5sums=('e067a8e39b1a97d62fc8e43800edee70' 
	'8a5d2261adb54199cf396e02757eb7e0'
	'd1b8a94eace113e073baced4ff58a438'
	'61923ebde4b2c9bdd5677e46a492bd6a')


build() {
  cd "${srcdir}/${_binaryname}-${pkgver}"
  echo Apply dmenu-patch
  patch -p1 < "${srcdir}/0001-fix-dmenu.patch"
  echo Apply cycle-patch
  patch -p1 < "${srcdir}/0002-fix-cycle.patch"
  echo Apply pad-patch
  patch -p1 < "${srcdir}/0003-fix-pad.patch"
  make || return 1
}

package() {
  cd "${srcdir}/${_binaryname}-${pkgver}"

  install -Dm755 "${_binaryname}" "${pkgdir}/usr/bin/${_binaryname}"
  install -Dm644 "${_binaryname}.1" "${pkgdir}/usr/share/man/man1/${_binaryname}.1"
}
