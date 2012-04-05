# Contributor: daemonTutorials <http://www.daemon-tuts.de>
pkgname=tibia-32bit
pkgver=9.51
pkgrel=1
pkgdesc="A free 2D online role playing game. Only works on arch32"
arch=('i686')
url="http://www.tibia.com/"
license=('custom:"CipSoft"')
[ "$CARCH" = "i686" ] && depends=('libxdamage' 'mesa')
#[ "$CARCH" = "x86_64" ] && depends=('lib32-libxdamage' 'lib32-mesa')
makedepends=('')
source=(http://download.tibia.com/tibia${pkgver/./}.tgz \
	tibia.desktop \
	tibia.png \
	tibia.sh)
md5sums=('127f9d22d19c478e27736dbb28fa9bb9' '5f5c3a2aca2df581608c8916e4020f77' \
	 '8aece042ac8ef9eca96c9fe95136817b' '31890b0547961924b58db0afc33e6411')

build() {
  cd ${srcdir}/Tibia

}

package() {
  cd ${srcdir}/Tibia
  install -d ${pkgdir}/usr/share/{applications,pixmaps,tibia} \
	     ${pkgdir}/usr/bin || return 1

  rm -rf ${srcdir}/Tibia/{libc6,*.sh}

  install -m755 ${startdir}/tibia.sh ${pkgdir}/usr/bin/tibia || return 1
  install -m755 Tibia ${pkgdir}/usr/share/tibia/ || return 1
  install -m644 {*.dat,*.pic,*.spr,Patch,Showerror} ${pkgdir}/usr/share/tibia/ || return 1

  install -m644 ${startdir}/tibia.desktop ${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${startdir}/tibia.png ${pkgdir}/usr/share/pixmaps/ || return 1
  install -m644 Tibia.xpm ${pkgdir}/usr/share/pixmaps/tibia.xpm || return 1
}
