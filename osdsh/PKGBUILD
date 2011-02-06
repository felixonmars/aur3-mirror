# Contributor: Coolaman <coolaman@free.fr>

pkgname=osdsh
pkgver=0.7
pkgrel=4
pkgdesc="little program that overlays system information using the XOSD library."
url="http://osdsh.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('xosd' 'deb2targz')
optdepends=('tk: osdshconfig' 'apmd: battery status' )

source=
[ "$CARCH" = i686   ] && source=(http://ftp.fr.debian.org/debian/pool/main/o/${pkgname}/${pkgname}_${pkgver}.0-10_i386.deb)
[ "$CARCH" = x86_64 ] && source=(http://ftp.fr.debian.org/debian/pool/main/o/${pkgname}/${pkgname}_${pkgver}.0-10_amd64.deb)
md5sums=
[ "$CARCH" = i686   ] && md5sums=('41d0904dd69ee50f1ba35bfc523b1bb1')
[ "$CARCH" = x86_64 ] && md5sums=('2024b10abf4beae8001bd55e2e8633d6')

build() {
  cd $startdir/src/  
  [ "$CARCH" = i686   ] && deb2targz ${pkgname}_${pkgver}.0-10_i386.deb && tar xzvf ${pkgname}_${pkgver}.0-10_i386.tar.gz
  [ "$CARCH" = x86_64   ] && deb2targz ${pkgname}_${pkgver}.0-10_amd64.deb && tar xzvf ${pkgname}_${pkgver}.0-10_amd64.tar.gz
  install -m 755 -D usr/bin/osdctl ${startdir}/pkg/usr/bin/osdctl
  install -m 755 -D usr/bin/osdsh ${startdir}/pkg/usr/bin/osdsh
  install -m 755 -D usr/bin/osdshconfig ${startdir}/pkg/usr/bin/osdshconfig
  mkdir -p $startdir/pkg/usr/lib/${pkgname}
  cp -a usr/lib/${pkgname}/* ${startdir}/pkg/usr/lib/${pkgname}
  mkdir -p ${startdir}/pkg/usr/share
  cp -r usr/share/* ${startdir}/pkg/usr/share  
}
