# $Id: PKGBUILD 44759 2009-07-03 21:39:41Z giovanni $
# Maintainer: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-no-x
_realname=wine
pkgver=1.1.39
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs without X dependencies with patch for d2gs."
url="http://www.winehq.com"
arch=('i686')
license=('LGPL')
depends=()
makedepends=('ncurses' 'perl' 'libxml2' 'flex' 'perl')
optdepends=("cups" "sane" "libgphoto2" "alsa-lib" "giflib" "libpng")
source=(http://downloads.sourceforge.net/$_realname/$_realname-${pkgver}.tar.bz2 d2gs.patch)
provides=("$_realname=$pkgver")
conflicts=('wine')


build() {
  cd ${srcdir}/${_realname}-${pkgver}
  patch -p1 < ../d2gs.patch || return 1
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
	      --without-x \
              --without-opengl \
              --without-freetype
  make depend || return 1
}
package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make || return 1
  make prefix=${pkgdir}/usr install || return 1
  mkdir -p ${pkgdir}/etc/wine
}
md5sums=('cbde85e50db653f54fe9da34be4a6de5'
         'a265aca53b8e6b2d56ed7a54b7df1bc5')
