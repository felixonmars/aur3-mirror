# $Id: PKGBUILD,v 1.16 2007/02/06 09:30:59 jgc Exp $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libopensync-plugin-synce
pkgver=0.22
pkgrel=1
pkgdesc="SynCE plugin for OpenSync"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.opensync.org/"
depends=('synce-libsynce' 'libopensync=0.22' )
source=(http://www.opensync.org/download/releases/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('f325b7dd9f273c46e77fb7b337325880')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  sed -i 's/-Werror//g' src/Makefile
  make || return 1 
  make DESTDIR=${startdir}/pkg install 
}
