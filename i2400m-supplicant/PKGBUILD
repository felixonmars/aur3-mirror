pkgname=i2400m-supplicant
pkgver=1.4.0
pkgrel=1
pkgdesc="Supplicant for Intel Link 5xxx family WiMax devices"
arch=(i686)
url="http://www.linuxwimax.org/"
license="IFDBL"
depends=('i2400m-fw')
source=("http://www.linuxwimax.org/Download?action=AttachFile&do=get&target=Intel-WiMAX-Binary-Supplicant-${pkgver}.tar.bz2")
md5sums=('cca89d80c0ffd5960686b556f118aefa')

build() {
  cd ${startdir}/src
  tar xjf "../Download?action=AttachFile&do=get&target=Intel-WiMAX-Binary-Supplicant-${pkgver}.tar.bz2"
  cd ${startdir}/src/Intel-WiMAX-Binary-Supplicant-${pkgver}
  mkdir -p $startdir/pkg/usr/lib/wimax
  cp ${startdir}/src/Intel-WiMAX-Binary-Supplicant-${pkgver}/ume/libwpa_wimax_supplicant.so.0 $startdir/pkg/usr/lib/wimax
  cd $startdir/pkg/usr/lib/wimax
  ln -s libwpa_wimax_supplicant.so.0 libwpa_wimax_supplicant.so
}
