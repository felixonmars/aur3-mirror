# $Id: PKGBUILD,v 1.2 2007/08/04 03:31:17 Snowman Exp $
# Maintainer: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=tk707
pkgver=0.8
pkgrel=2
pkgdesc="A 7x7 type midi drum sequencer for Linux"
arch=('i686' 'x86_64')
url="http://ljk.imag.fr/membres/Pierre.Saramito/tk707/"
license=('GPL')
depends=('alsa-lib' 'tk')
source=(http://ljk.imag.fr/membres/Pierre.Saramito/tk707/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('7471494195c053f048862c292320d06c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  sed -i -e 's|set PKGDATADIR \$(pkgdatadir)|set PKGDATADIR $(pkgdatadir)\\\\n\\\\|' Makefile || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg htmldir=/usr/share/${pkgname} \
  install || return 1
}
