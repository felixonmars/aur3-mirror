# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=trommler
pkgver=3.7
pkgrel=1
pkgdesc="An X11/GTK based Linux drum machine"
arch=(i686)
url="http://muth.org/Robert/Trommler/"
license=('GPL')
depends=('gtk2')
makedepends=('python')
source=(http://muth.org/Robert/Trommler/${pkgname}.${pkgver}.tar.gz)
md5sums=('971cc21a590fcfb7d01d7fb30d39d813')

build() {
  cd ${startdir}/src/Trommler

  rm -f ${pkgname} playsample wav2smp

  make export.h || return 1
  make all || return 1

  mkdir -p ${startdir}/pkg/usr/bin
  install -D -m755 ${pkgname} ${startdir}/pkg/usr/bin/${pkgname}
  install -D -m755 playsample ${startdir}/pkg/usr/bin/playsample
  install -D -m755 wav2smp ${startdir}/pkg/usr/bin/wav2smp

  mkdir -p ${startdir}/pkg/usr/share/${pkgname}/{Drums,Songs}
  install -m644 Drums/*.smp ${startdir}/pkg/usr/share/${pkgname}/Drums/
  install -m644 Songs/*.sng ${startdir}/pkg/usr/share/${pkgname}/Songs/
}
