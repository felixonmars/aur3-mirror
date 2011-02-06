# Maintainer: maoserr

pkgname=redshiftgui
pkgver=0.2.1
pkgrel=1
pkgdesc="Monitor color adjustment tool"
arch=('i686' 'x86_64')
url="http://github.com/maoserr/redshiftgui/downloads"
license=('GPL2')
depends=('gtk2' 'curl' 'libxcb' 'libxrandr' 'libxxf86vm')
source=(http://github.com/downloads/maoserr/redshiftgui/RedshiftGUI-${pkgver}-Linux-${CARCH}.tar.gz)
md5sums=('22a26a1dbde8670878060605e0f9ad7f')
[ $CARCH = 'x86_64' ] && md5sums=('c332d44b8bf8a4561c086b1d7f1bc066')

build() {
  cd $srcdir/RedshiftGUI-${pkgver}-Linux-${CARCH}
  mkdir -p $pkgdir/usr/{bin,share}
  install -m755 bin/redshiftgui $pkgdir/usr/bin
  mv share/* $pkgdir/usr/share/
}
