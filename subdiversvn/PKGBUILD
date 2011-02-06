# Maintainer: Hubert Star <hubertstar@gmail.com>
pkgname=subdiversvn
pkgver=0.1.1
_pkgver=0.1-1
pkgrel=1
pkgdesc="SubdiverSVN is a Subversion client for Linux with GTKmm library."
arch=('i686' 'x86_64')
license=('Apache License')
url="http://subdiversvn.sourceforge.net/"
depends=('gsvnclientcore' 'nautilus')
source=(http://downloads.sourceforge.net/subdiversvn/subdiversvn-${_pkgver}.tar.gz)
options=('!makeflags' '!emptydirs' 'docs')
md5sums=('da034da9ec2f156fee9213bd253de3b0')
build() {
  cd ${startdir}/src/subdiversvn-${_pkgver}
  ./configure --prefix=/usr --enable-thunar-extension=no
  #fix non-standard directory
  cd gSvnDesktop/nautilus-extension
  sed -i "s|NAUTILUS_EXTDIR = /usr/|NAUTILUS_EXTDIR = ${startdir}/pkg/usr/|" Makefile
  cd ../../
  
  make || return 1
  
  mkdir -p ${startdir}/pkg/usr/lib/nautilus/extensions-2.0/
  
  make DESTDIR=${startdir}/pkg install
}
