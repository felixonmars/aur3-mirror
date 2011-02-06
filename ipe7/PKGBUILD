#Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=ipe7
_pkgname=ipe
pkgver=7.0.4
pkgrel=1
pkgdesc="The Ipe extensible drawing editor"
url="http://tclab.kaist.ac.kr/ipe/"
depends=('lua' 'qt' 'freetype2' 'zlib')
arch=('i686' 'x86_64')
license="GPL"
conflicts=('ipe')
# ftiversion_=20080517
# ptiversion_=20070509
source=(http://downloads.sourceforge.net/project/$pkgname/$_pkgname/$_pkgname-$pkgver-src.tar.gz config.patch)
md5sums=('56b88a5f4c69bd13cef2927481109196'
         '8755874d2569ab2b01696062850d655e')

build() {
 # Build Ipe
 cd $startdir/src/$_pkgname-$pkgver/src
 patch config.mak < $startdir/src/config.patch

 make IPEPREFIX=/usr
 INSTALL_ROOT=$startdir/pkg make install IPEPREFIX=/usr

 # Make QVoronoi Ipelet
 # cd $startdir/src/$pkgname-$pkgnamever/src/ipelets/qvoronoi
 # qmake IPEPREFIX=/usr INCLUDEPATH+=/usr/include/qhull
 # make || return 1
 # INSTALL_ROOT=$startdir/pkg make install

 # # Build figtoipe
 # cd $startdir/src/figtoipe-$ftiversion_
 # make || return 1
 # cp figtoipe $startdir/pkg/usr/bin

 # # Build pdftoipe
 # cd $startdir/src/pdftoipe-$ptiversion_
 # qmake
 # make || return 1
 # cp pdftoipe $startdir/pkg/usr/bin
} 
