# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Michael S. Walker <barrucadu@cthulhu>
pkgname=qlight-snapshot  
pkgver=0.2
pkgrel=1 
pkgdesc="A software suite for mac os x, linux and windows to control dmx devices."
url="http://soft.pmad.net/qlight/index.htm"
arch=('i686')
license=('GPL')
depends=(qt libusb)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://soft.pmad.net/files/qlight/qlight-linux-snapshot.tar.gz)
md5sums=('0de2a605e0d11ea4d9eb3f2d99e61d0e')
build() {
  cd $startdir/src/
  
  for file in *; do
    install -D -m 0755 $file $startdir/pkg/usr/bin/$file
  done
}