# Maintainer: Hubert Star <hubertstar@gmail.com>
pkgname=gsvnclientcore
pkgver=1.5.2.1
_pkgver=1.5.2-1
pkgrel=1
pkgdesc="SubdiverSVN is a Subversion client for Linux with GTKmm library."
arch=('i686' 'x86_64')
license=('Apache License')
url="http://subdiversvn.sourceforge.net/"
depends=('gtkmm' 'libglademm' 'subversion')
source=(http://downloads.sourceforge.net/subdiversvn/gSvnClientCore-${_pkgver}.tar.gz)
options=('!makeflags' '!emptydirs' 'docs')
md5sums=('674925afac9cedaebfed5f8e6023b57c')
build() {
  cd ${startdir}/src/gSvnClientCore-${_pkgver}
  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
