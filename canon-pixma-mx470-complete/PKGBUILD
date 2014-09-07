# Maintainer:      Dana Ryce <silverbullet763@hotmail.com>

pkgname=canon-pixma-mx470-complete
pkgver=4.10
pkgrel=1
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MX470 series"
url=('http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MX_series/PIXMA_MX474.aspx?type=download&language=&os=Linux')
arch=('i686' 'x86_64')
license=('custom')
depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4')

if [ "$CARCH" = 'x86_64' ]; then
  _arch='amd64'
  depends=('lib32-libcups' 'lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-gtk2')
elif [ "$CARCH" = "i686" ]; then
  _arch='i386'
  depends=('libcups' 'popt' 'libpng12' 'libusb-compat' 'libtiff4' 'gtk2')
fi
source=('https://www.dropbox.com/s/e7ce8rsqt5u2dox/cnijfilter-mx470series-4.10-1-deb.tar.gz?dl=0'
        'https://www.dropbox.com/s/0qhawldev0dozph/scangearmp-mx470series-2.30-1-deb.tar.gz?dl=0')
md5sums=('fb955b2f93b5c1c63f373c07f91af17c'
         '7a04cd678e05812ee536d49ec1f32ac1')

package(){
  cd ${srcdir}/cnijfilter-mx470series-4.10-1-deb/packages/
  ar x cnijfilter-common_4.10-1_i386.deb
  install data.tar.gz ${pkgdir}/cnijfilter-common_4.10-1_i386.tar.gz
  ar x cnijfilter-mx470series_4.10-1_i386.deb
  install data.tar.gz ${pkgdir}/cnijfilter-mx470series_4.10-1_i386.tar.gz

  cd ${srcdir}/scangearmp-mx470series-2.30-1-deb/packages
  ar x scangearmp-common_2.30-1_i386.deb
  install data.tar.gz ${pkgdir}/scangearmp-common_2.30-1_i386.tar.gz
  ar x scangearmp-mx470series_2.30-1_i386.deb
  install data.tar.gz ${pkgdir}/scangearmp-mx470series_2.30-1_i386.tar.gz


  cd ${pkgdir}

  tar -xf cnijfilter-common_4.10-1_i386.tar.gz
  rm cnijfilter-common_4.10-1_i386.tar.gz
  tar -xf cnijfilter-mx470series_4.10-1_i386.tar.gz
  rm cnijfilter-mx470series_4.10-1_i386.tar.gz
  tar -xf scangearmp-common_2.30-1_i386.tar.gz
  rm scangearmp-common_2.30-1_i386.tar.gz
  tar -xf scangearmp-mx470series_2.30-1_i386.tar.gz
  rm scangearmp-mx470series_2.30-1_i386.tar.gz
}
