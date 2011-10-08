pkgname=i2400m-firmware
pkgver=1.5.0
pkgrel=2
pkgdesc="Firmware for Intel Link 5xxx/6xxx family WiMax devices"
arch=('i686' 'x86_64')
url="http://www.linuxwimax.org/"
license="IFDBL"
depends=()
source=("http://212.219.56.139/sites/www.ibiblio.org/gentoo/distfiles/i2400m-fw-${pkgver}.tar.bz2")
md5sums=('c65931c4016b296ff660be4557939fba')

build() {
  cd ${startdir}/src
  mkdir -p $startdir/pkg/lib/firmware
  mv ${srcdir}/i2400m-fw-1.5.0/*.sbcf $startdir/pkg/lib/firmware
}
