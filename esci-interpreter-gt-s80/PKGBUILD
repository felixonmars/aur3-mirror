# Maintainer: Christopher Heien <chris.h.heien@gmail.com>
# Contributor: Stéphane Brunet <stephane at stephanebrunet dot net>

pkgname=esci-interpreter-gt-s80
pkgver=0.1.1_2
pkgrel=1
pkgdesc="iscan plugin for Epson GT-S50 and GT-S80 scanner."
arch=('i686' 'x86_64')
url="http://www.avasys.jp/english/linux_e/"
license=('custom')
depends=('iscan' 'iscan-data')
makedepends=('deb2targz')
install=gt-s80.install
source=(http://linux.avasys.jp/drivers/iscan-plugins/${pkgname}/${pkgver//_*//}/${pkgname}_${pkgver//_/-}_i386.deb)
[[ $CARCH == "x86_64" ]] && \
source=(http://linux.avasys.jp/drivers/iscan-plugins/${pkgname}/${pkgver//_*//}/${pkgname}_${pkgver//_/-}_amd64.deb)
md5sums=('2e4d77fa60e5727b83ac49f7d2e0d6e3')
[[ $CARCH == "x86_64" ]] && md5sums=('8e9ce30763047de7eeba31a1d383b34a')
build() {
  cd $srcdir
  deb2targz $(basename ${source[0]})
  tar -xf $(basename ${source[0]//.deb/.tar.gz})
  mv usr ${pkgdir}/
  mkdir $pkgdir/usr/share/licences
  mv ${pkgdir}/usr/share/doc/* $pkgdir/usr/share/licences/
  rmdir $pkgdir/usr/share/doc
}


