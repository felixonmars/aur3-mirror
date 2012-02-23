# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=corel-aftershot-pro
pkgver=1
pkgrel=1
pkgdesc="Photo management software"
url="http://www.corel.com/corel/product/index.jsp?pid=prod4670071"
license="custom"
arch=(i686 x86_64)

[ "$CARCH" = i686   ] && source=(http://www.corel.com/akdlm/6763/downloads/AfterShotPro/1/PF/AfterShotPro_i386.deb)
[ "$CARCH" = x86_64 ] && source=(http://www.corel.com/akdlm/6763/downloads/AfterShotPro/1/PF/AfterShotPro_amd64.deb)

[ "$CARCH" = i686   ] && md5sums=('cf23a5b0cb5ba233302722dc46a8286c')
[ "$CARCH" = x86_64 ] && md5sums=('8f65d05345cca1b9cf3a95828e962055')

[ "$CARCH" = i686   ] && makedepends=('binutils' 'libpng12')
[ "$CARCH" = x86_64 ] && makedepends=('binutils-multilib' 'lib32-libpng12')

build() {
    cd "$srcdir"
    
    [ "$CARCH" = i686   ] && ar vx AfterShotPro_i386.deb
    [ "$CARCH" = x86_64 ] && ar vx AfterShotPro_amd64.deb
    
    tar -xzvf data.tar.gz
}

package () {
    
    mv "$srcdir"/opt "$pkgdir"/opt
    mv "$srcdir"/usr "$pkgdir"/usr
    
    [ "$CARCH" = i686   ] && cp /usr/lib/libpng12.so.0 "$pkgdir"/opt/AfterShotPro/lib
    [ "$CARCH" = x86_64 ] && cp /usr/lib32/libpng12.so.0 "$pkgdir"/opt/AfterShotPro/lib
}
