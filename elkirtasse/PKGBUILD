#
# PKGBUILD for package elkirtasse
#
# Copyright (c) 2011-2013 abouzakaria (source),
# 
#
# Please submit bugfixes or comments via
# http://elkirtasse.sourceforge.net
#

pkgname=elkirtasse
pkgver=3.6.8
pkgrel=2
pkgdesc=" Library elkirtasse is a free and open source program, for operating systems, Linux, Windows, or Mac, lets you view and edit books. And you can add news books. "
arch=('i686' 'x86_64')
url="http://elkirtasse.sourceforge.net"
license=('GPL')
depends=('qt4' 'mesa-libgl' 'poppler-qt4' 'wget' 'ca-certificates' 'ca-certificates-utils')
makedepends=('make' 'qt4')
source=("https://build.opensuse.org/source/home:abouzakaria/elkirtasse/elkirtasse_${pkgver}.tar.gz")
md5sums=('22feb694162f0e71003793b782d6d87b')

build() {
  cd ${srcdir}/${pkgname}_${pkgver}
 
  qmake-qt4 elkirtasse.pro
  make 
}

package() {
  cd ${srcdir}/${pkgname}_${pkgver}
 
  
  #make INSTALL_PREFIX="$pkgdir" install
  
   mkdir -p ${pkgdir}/usr/bin
   mkdir -p ${pkgdir}/usr/lib/${pkgname}/plugins
    mkdir -p ${pkgdir}/usr/share/elkirtasse
   mkdir -p ${pkgdir}/usr/share/icons
    
   cp -R usr/share/elkirtasse ${pkgdir}/usr/share
   cp -R usr/share/icons ${pkgdir}/usr/share
    cp -R usr/bin/${pkgname} ${pkgdir}/usr/bin
        
  install -D -m 644 -T usr/share/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop  
    
   cp -f usr/share/elkirtasse/plugins/libkirtassecdrom.so ${pkgdir}/usr/lib/${pkgname}/plugins/libkirtassecdrom.so
    cp -f usr/share/elkirtasse/plugins/libkirtassenet.so ${pkgdir}/usr/lib/${pkgname}/plugins/libkirtassenet.so
    cp -f usr/share/elkirtasse/plugins/libkirtasserowat.so ${pkgdir}/usr/lib/${pkgname}/plugins/libkirtasserowat.so
}
