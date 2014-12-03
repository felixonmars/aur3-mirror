# Maintainer:  Ben "WACOMalt" Sumner  <wacomalt att gmail dott com>
# Contributor:  JJ Hiblot  <jjhiblot att traphandler dott com>

# Based on PKGBUILD from https://aur.archlinux.org/packages/canon-pixma-mg5200-complete/
# Scanner icon source: http://openiconlibrary.sourceforge.net/gallery2/open_icon_library-full/icons/png/64x64/devices/scanner-3.png

# Only tested with x86_64 architecture

pkgname=canon-pixma-mg6100-complete
pkgver=3.40
pkgrel=2
pkgdesc="Complete stand alone driver set (printing and scanning) for Canon Pixma MG6100 series (MG6120 etc.)"
url='http://www.usa.canon.com/cusa/support/consumer/printers_multifunction/pixma_mg_series/pixma_mg6120'
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"
if [ ${CARCH} = 'x86_64' ]; then
  depends=('lib32-popt' 'lib32-libpng12' 'lib32-libusb-compat' 'lib32-libtiff4' 'lib32-libxml2' 'lib32-gtk2')
elif [ ${CARCH} = 'i686' ]; then
  depends=('popt' 'libpng12' 'libusb-compat' 'libtiff4' 'libxml2' 'gtk2')
fi
makedepends=('deb2targz' 'sed')
source=('http://gdlp01.c-wss.com/gds/8/0100003018/01/cnijfilter-mg6100series-3.40-1-deb.tar.gz'
         'http://gdlp01.c-wss.com/gds/1/0100003031/01/scangearmp-mg6100series-1.60-1-deb.tar.gz'
         "${pkgname}.license"
         "${pkgname}-scangear.desktop"
         "${pkgname}-scangear-icon.png")
md5sums=('3be41fdb9f88897f0724a254f67f4935'
         '41adc5eee4837ec23bec9fd8137111e9'
         '487ff6a019ab63b15ec49df6e5bf3d8c'
         '13044439eedbea9af76dede6a09ae448'
         '3feefd413092d7152f47b7451ba79efe')

_printDrvSrc='cnijfilter-mg6100series-3.40-1-deb'
_scanDrvSrc='scangearmp-mg6100series-1.60-1-deb'

_printDrvDebCommon='cnijfilter-common_3.40-1_i386'
_printDrvDebMain='cnijfilter-mg6100series_3.40-1_i386'

_scanDrvDebCommon='scangearmp-common_1.60-1_i386'
_scanDrvDebMain='scangearmp-mg6100series_1.60-1_i386'

_ppdFile="canonmg6100.ppd"

build(){
   cd ${srcdir}

   # Unpack driver source files

   tar xvzf ${_printDrvSrc}.tar.gz
   tar xvzf ${_scanDrvSrc}.tar.gz

   rm -v *.tar.gz
}

package(){
   cd ${pkgdir}

   # Unpack debian installer files

   cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebCommon}.deb" .
   cp "${srcdir}/${_printDrvSrc}/packages/${_printDrvDebMain}.deb" .
   cp "${srcdir}/${_scanDrvSrc}/packages/${_scanDrvDebCommon}.deb" .
   cp "${srcdir}/${_scanDrvSrc}/packages/${_scanDrvDebMain}.deb" .

   deb2targz "${_printDrvDebCommon}.deb"
   deb2targz "${_printDrvDebMain}.deb"
   deb2targz "${_scanDrvDebCommon}.deb"
   deb2targz "${_scanDrvDebMain}.deb"

   rm -v *.deb

   tar xzvf "${_printDrvDebCommon}.tar.gz"
   tar xzvf "${_printDrvDebMain}.tar.gz"
   tar xzvf "${_scanDrvDebCommon}.tar.gz"
   tar xzvf "${_scanDrvDebMain}.tar.gz"

   rm -v *.tar.gz

   # Move ppd file to where cups expects

   install -vDm 644 "${pkgdir}/usr/share/ppd/${_ppdFile}" "${pkgdir}/usr/share/cups/model/${_ppdFile}"

   rm -vrf ${pkgdir}/usr/share/ppd

   # Fix udev rules

   sed -i -e "s/SYSFS/ATTR/g" "${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules"

   # Install custom license file

   install -vDm 644 "${srcdir}/${pkgname}.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   
   # Install entry in application menu, including icon

   install -vDm 644 "${srcdir}/${pkgname}-scangear.desktop" "${pkgdir}/usr/share/applications/${pkgname}-scangear.desktop"
   install -vDm 644 "${srcdir}/${pkgname}-scangear-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-scangear-icon.png"
}
