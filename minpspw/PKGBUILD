# Maintainer: Nico Suarez <nicodoggie@gmail.com>
pkgname=minpspw
pkgver=0.11.2
pkgrel=2
pkgdesc="A PSPSDK distribution, with freely distributable import libraries and header files (DevPaks) for building cross compiled homebrew Sony PSP (PlayStation Portable) applications."
arch=('x86_64')
url="http://www.jetdrone.com/minpspw"
license=('GPL')
source=(http://downloads.sourceforge.net/project/minpspw/SDK%20%2B%20devpak/pspsdk%200.11.2/${pkgname}_${pkgver}-amd64.tar.lzma)
md5sums=(556383bc45b67bdec819f25ae2d52e7b)
options=(!strip staticlibs)
package() {
	cp -rf ${srcdir}/opt/ ${pkgdir}/opt
  chmod 0755 ${pkgdir}/opt
}
# vim:set ts=2 sw=2 et
