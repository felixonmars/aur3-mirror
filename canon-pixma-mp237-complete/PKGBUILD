# Maintainer:  cidtux <cidtux@gmail.com>
# Modified from canon-pixma-mx520-complete by Jeremy Sands <cto@jeremysands.com>
pkgname=canon-pixma-mp237-complete
pkgver=3.80
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MP237 series"
url=('http://www.canon.co.uk/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MX_series/MP237.aspx')
arch=('i686' 'x86_64')
license=('custom')
if [ ${CARCH} = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-gtk2')
elif [ ${CARCH} = 'i686' ]; then
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4' 'gtk2')
fi
makedepends=('binutils')
source=('http://gdlp01.c-wss.com/gds/9/0100004659/01/cnijfilter-mp230series-3.80-1-deb.tar.gz'
	'http://gdlp01.c-wss.com/gds/5/0100004695/01/scangearmp-mp230series-2.00-1-deb.tar.gz')
md5sums=('ae44ac1c68fe0e0f3033ef647b787fa7'
	'42f2813be04e4b65f6a72578520f21cf')

build(){
  cd ${srcdir}/cnijfilter-mp230series-3.80-1-deb/packages/
  install cnijfilter-common_3.80-1_i386.deb ${pkgdir}
  install cnijfilter-mp230series_3.80-1_i386.deb ${pkgdir}

  cd ${srcdir}/scangearmp-mp230series-2.00-1-deb/packages
  install scangearmp-common_2.00-1_i386.deb ${pkgdir}
  install scangearmp-mp230series_2.00-1_i386.deb ${pkgdir}
  
  cd ${pkgdir}

  ar -x cnijfilter-common_3.80-1_i386.deb data.tar.gz
  tar -xzf data.tar.gz
  rm cnijfilter-common_3.80-1_i386.deb
  rm data.tar.gz
 
  ar -x cnijfilter-mp230series_3.80-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm cnijfilter-mp230series_3.80-1_i386.deb
  rm data.tar.gz
 
  ar -x scangearmp-common_2.00-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-common_2.00-1_i386.deb
  rm data.tar.gz
 
  ar -x scangearmp-mp230series_2.00-1_i386.deb data.tar.gz
  tar -xvf data.tar.gz
  rm scangearmp-mp230series_2.00-1_i386.deb
  rm data.tar.gz
}
