# Contributor: Johannes Sjolund <j.sjolund@gmail.com>

pkgname=gimp-plugin-separate
pkgver=0.5.9alpha1
pkgrel=1
pkgdesc="Plugin for The GIMP providing rudimentary CMYK support, contains Adobe ICC Profiles."
arch=('i686' 'x86_64')
url="http://www.blackfiveservices.co.uk/separate.shtml"
license="GPL"
depends=('gimp' 'gtk2')
makedepends=('pkgconfig' 'gcc' 'lcms' 'libtiff')
install="gimp-plugin-separate.install"

source=('http://iij.dl.sourceforge.jp/separate-plus/51630/separate+-0.5.9-alpha1.zip' \
        'http://download.adobe.com/pub/adobe/iccprofiles/win/AdobeICCProfiles.zip' \
		'fix_missing_libm_error.patch' \
        'gimp-plugin-separate.install')

md5sums=('SKIP' \
         '485a2c42cfd7b5a40a6dc453bca5d174' \
		 'SKIP' \
         'ebde497864e63c0c5ba400486c1e8664')

build() {
  cd ${srcdir}/separate+-0.5.9/

  patch -p1 < ../fix_missing_libm_error.patch
  make

 


}
package() {
  cd ${srcdir}/separate+-0.5.9/
  mkdir -p ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
  mkdir -p ${pkgdir}/usr/share/color/icc/
  
  install -D -m755 separate ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
  install -D -m755 icc_colorspace ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
  install -D -m755 separate_import ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
  
  install -D -m644 sRGB/*.icc ${pkgdir}/usr/share/color/icc/

 # These Adobe ICC Profiles are not licensed under the GPL.
 # Read the End-User License Agreement at:
 # http://www.adobe.com/support/downloads/license.html
  install -D -m644 ${srcdir}/Adobe\ ICC\ Profiles/CMYK\ Profiles/*  ${pkgdir}/usr/share/color/icc/
  install -D -m644 ${srcdir}/Adobe\ ICC\ Profiles/RGB\ Profiles/*  ${pkgdir}/usr/share/color/icc/
}

