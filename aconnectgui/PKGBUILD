# $Id: PKGBUILD,v 1.2 2007/07/25 02:14:33 Snowman Exp $
# Maintainer: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=aconnectgui
pkgver=0.9.0rc2.1
_pkgver=0.9.0rc2-1
pkgrel=1
pkgdesc="A graphical ALSA sequencer connection manager"
arch=('i686' 'x86_64')
url="http://archive.ubuntu.com/ubuntu/pool/universe/a/aconnectgui/aconnectgui_0.9.0rc2-1.orig.tar.gz"
license=('GPL')
depends=('alsa-lib' 'fltk')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/a/aconnectgui/aconnectgui_0.9.0rc2-1.orig.tar.gz)
md5sums=('3d7de1936c06df37c81b5ab4a5add9fd')

build() {
  cd ${startdir}/src/${pkgname}-${_pkgver}.orig

  aclocal || return 1
  automake -a --foreign || return 1
  autoconf  || return 1

  ./configure || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
