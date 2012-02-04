pkgname=i2400m-fw
pkgver=1.4.0
pkgrel=1
pkgdesc="Firmware for Intel Link 5xxx family WiMax devices"
arch=(i686 x86_64)
url="http://www.linuxwimax.org/"
license="IFDBL"
depends=()
source=("http://www.linuxwimax.org/Download?action=AttachFile&do=get&target=${pkgname}-${pkgver}.tar.bz2")
md5sums=('d2aa2da73926fc23d5ff748f64bd520d')

build() {
  cd ${startdir}/src
  tar xjf "../Download?action=AttachFile&do=get&target=${pkgname}-${pkgver}.tar.bz2"
  mkdir -p $startdir/pkg/lib/firmware
  mv ${pkgname}-${pkgver}/i2400m-fw-usb-1.4.sbcf $startdir/pkg/lib/firmware
}
