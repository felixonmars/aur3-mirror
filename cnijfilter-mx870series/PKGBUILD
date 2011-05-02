# Maintainer: Brandon Thomas (brandon.thomas@gmail.com) 

pkgname=cnijfilter-mx870series
pkgver=3.30
pkgrel=1
pkgdesc="MX870 series IJ Printer Driver"
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100272302.html"
arch=('i686' 'x86_64')
license=('custom')
provides=('cnijfilter-common')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt')
elif [ "${CARCH}" = 'i686' ]; then
    depends=('libcups' 'popt')
fi
makedepends=('deb2targz')
source=('http://gdlp01.c-wss.com/gds/3/0100002723/01/cnijfilter-mx870series-3.30-1-i386-deb.tar.gz')
md5sums=('2aae1637d5f4c1bf10095fb5473f18c2')

build(){
  cd ${srcdir}/cnijfilter-mx870series-3.30-1-i386-deb/packages/
  install cnijfilter-common_3.30-1_i386.deb ${pkgdir}
  install cnijfilter-mx870series_3.30-1_i386.deb ${pkgdir}

  cd ${pkgdir}

  deb2targz cnijfilter-common_3.30-1_i386.deb
  tar -xvf cnijfilter-common_3.30-1_i386.tar.gz
  rm cnijfilter-common_3.30-1_i386.deb
  rm cnijfilter-common_3.30-1_i386.tar.gz

  deb2targz cnijfilter-mx870series_3.30-1_i386.deb
  tar -xvf cnijfilter-mx870series_3.30-1_i386.tar.gz
  rm cnijfilter-mx870series_3.30-1_i386.deb
  rm cnijfilter-mx870series_3.30-1_i386.tar.gz
}
