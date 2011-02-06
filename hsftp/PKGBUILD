# Maintainer: Nathan Owe. <ndowens.aur at gmail dot com>
pkgname=hsftp
pkgver=1.15
pkgrel=2
pkgdesc="An ftp emulator that looks as an ftp session, but uses ssh to
transport commands and data."
arch=('i686')
url="http://la-samhna.de/hsftp/"
license=('GPL')
depends=('glibc')
source=(http://la-samhna.de/hsftp/${pkgname}-${pkgver}.tar.gz)
md5sums=('933b25a898978650a2a18372b5208a00')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make 
  make bindir=${pkgdir}/usr/bin mandir=${pkgdir}/usr/share/man  install
}
