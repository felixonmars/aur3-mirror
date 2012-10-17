# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: cuihao <cuihao dot leo at gmail dot com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be> 
# Contributor: Aurelien Desbrieres <ice.cube@gmx.com>

# Original PKGBUILD:
# $Id: PKGBUILD 141087 2011-10-23 16:12:32Z andyrtr $
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: tobias <tobias funnychar archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=exo-dev
_pkgname=exo
pkgver=0.9.0
_pkgver=0.9
pkgrel=1
pkgdesc="Extensions to Xfce by os-cillation (Dev Ver)"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL')
url="http://www.xfce.org/projects/exo"
depends=("libxfce4util>=4.9.0" "libxfce4ui>=4.9" 'hicolor-icon-theme')
makedepends=('pygtk' 'perl-uri' 'intltool' 'gtk-doc')
optdepends=('perl-uri: for mail-compose helper script' 'xorg-iceauth: for ICE integration')
provides=('libxfce4ui=4.10.0')
conflicts=('exo-devel' 'exo')
options=('!libtool')
install=$pkgname.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/${_pkgver}/${_pkgname}-${pkgver}.tar.bz2)
sha1sums=('70ca9858e3f1608ca35705f682f339ca01447128')

groups=('xfce4-devel')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # python2 fix
  export PYTHON=python2
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib/xfce4 \
	--localstatedir=/var  \
	--disable-static \
	--enable-gio-unix \
	--enable-gtk-doc \
	--disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
