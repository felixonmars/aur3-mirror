# $Id$
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Markus M. May <mmay@javafreedom.org>

pkgname=vice-gnome
_basename=vice
pkgver=2.3
pkgrel=1
pkgdesc="A Versatile Commodore Emulator with gnome UI"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.viceteam.org/"
depends=('esound' 'gcc-libs' 'giflib' 'lame' 'libxrandr' 'libxv' 'libjpeg>=8' 'libpng>=1.4.0' 'libxaw' 'libxxf86vm')
makedepends=('xorg-font-utils')
conflicts=('vice')
replaces=('vice')
options=('!makeflags')
source=(http://downloads.sourceforge.net/project/vice-emu/releases/${_basename}-${pkgver}.tar.gz
        vice-2.3-x11video.patch)
md5sums=('b48d137874daad50c087a0686cbdde34'
         '088292ce9efe785edfb2b0c7c670785e')

build() {
  cd "${srcdir}/${_basename}-${pkgver}"

  patch -Np1 -i ${srcdir}/vice-2.3-x11video.patch || return 1
  ./configure --prefix=/usr \
              --enable-fullscreen \
              --enable-gnomeui
  make || return 1
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"

  make DESTDIR="${pkgdir}" install || return 1
}
