# Maintainer: nem <nem at ikitten dot co dot uk>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=musca
pkgver=0.9.24
pkgrel=3
pkgdesc='musca wm - with a patchset fixing a few common bugs'
arch=('i686' 'x86_64')
url='http://aerosuidae.net/musca.html'
license=('GPL3')
depends=('libx11' 'dmenu')
conflicts=('musca-fixed')
source=("http://aerosuidae.net/${pkgname}-${pkgver}.tgz"
	"0001-fix-dmenu.patch"
	"0002-fix-cycle.patch"
	"0003-fix-pad.patch")
md5sums=('e067a8e39b1a97d62fc8e43800edee70' 
	'8a5d2261adb54199cf396e02757eb7e0'
	'd1b8a94eace113e073baced4ff58a438'
	'050f632a426ce8f401a12f37c69b0b07')

build() {
  warning "The fix for dmenu changes the configuration of it!"
  warning "old original config was: 'set dmenu dmenu <parameters>'"
  warning "new patched config: 'set dmenu <parameters>'"
  warning "In words: just pass the dmenu parameters!"
  warning "So be sure to change your .musca_start or custom config.h accordingly!"
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo Apply dmenu-patch
  patch -p1 < "${srcdir}/0001-fix-dmenu.patch"
  echo Apply cycle-patch
  patch -p1 < "${srcdir}/0002-fix-cycle.patch"
  echo Apply pad-patch
  patch -p1 < "${srcdir}/0003-fix-pad.patch"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
