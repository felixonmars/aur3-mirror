# Maintainer: gee
pkgname=sgminer-adl-sdk
pkgver=6.0
pkgrel=1
pkgdesc="ADL package for the various sgminer.  You must download the adl file manually and drop it in the same folder as this PKGBUILD!"
# ADL at: http://developer.amd.com/tools-and-sdks/graphics-development/display-library-adl-sdk/" #
arch=('i686' 'x86_64')
url="http://developer.amd.com/tools-and-sdks/graphics-development/display-library-adl-sdk/"
license=('proprietary')
makedepends=('unzip')


build(){
  adl="$srcdir/../ADL_SDK_6.0.zip"
  if [ ! -e ${adl} ]
  then
    msg "Please drop the ADL file $adl in `pwd`/../ then press enter"
    read
  fi
  unzip -jod "ADL_SDK/" "${adl}" "include/*.h"
}

package() {
    adlFolder=$pkgdir/opt/sgminer-adl-sdk
    mkdir -p $ $adlFolder
    install -D -m644 ADL_SDK/*.h $adlFolder    
}
