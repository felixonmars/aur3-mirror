# Maintainer:  Jeremy Sands <cto@jeremysands.com>

pkgname=canon-pixma-mx520-complete
pkgver=3.90
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX520 series"
url=('http://www.canon.co.uk/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MX_series/MX524.aspx?DLtcmuri=tcm:14-1030669&page=1&type=download')
arch=('i686' 'x86_64')
license=('custom')
if [ ${CARCH} = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-gtk2')
elif [ ${CARCH} = 'i686' ]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4' 'gtk2')
fi
makedepends=('deb2targz')
source=('http://gdlp01.c-wss.com/gds/5/0100005155/01/cnijfilter-mx520series-3.90-1-deb.tar.gz'
	'http://gdlp01.c-wss.com/gds/9/0100005179/01/scangearmp-mx520series-2.10-1-deb.tar.gz')
md5sums=('a58da1834d275590193cd91b018053fa'
	'9bdc8fe0f63f4d0cbc15b360d18483fc')

build(){
  cd ${srcdir}/cnijfilter-mx520series-3.90-1-deb/packages/
  install cnijfilter-common_3.90-1_i386.deb ${pkgdir}
  install cnijfilter-mx520series_3.90-1_i386.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mx520series-2.10-1-deb/packages
  install scangearmp-common_2.10-1_i386.deb ${pkgdir}
  install scangearmp-mx520series_2.10-1_i386.deb ${pkgdir}
  
  cd ${pkgdir}

  deb2targz cnijfilter-common_3.90-1_i386.deb
  tar -xvf cnijfilter-common_3.90-1_i386.tar.gz
  rm cnijfilter-common_3.90-1_i386.deb
  rm cnijfilter-common_3.90-1_i386.tar.gz

  deb2targz cnijfilter-mx520series_3.90-1_i386.deb
  tar -xvf cnijfilter-mx520series_3.90-1_i386.tar.gz
  rm cnijfilter-mx520series_3.90-1_i386.deb
  rm cnijfilter-mx520series_3.90-1_i386.tar.gz

  deb2targz scangearmp-common_2.10-1_i386.deb
  tar -xvf scangearmp-common_2.10-1_i386.tar.gz
  rm scangearmp-common_2.10-1_i386.deb
  rm scangearmp-common_2.10-1_i386.tar.gz

  deb2targz scangearmp-mx520series_2.10-1_i386.deb
  tar -xvf scangearmp-mx520series_2.10-1_i386.tar.gz
  rm scangearmp-mx520series_2.10-1_i386.deb
  rm scangearmp-mx520series_2.10-1_i386.tar.gz
}
