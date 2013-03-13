# Maintainer : Atilla ÖNTAŞ <tarakbumba@gmail.com>
# Contributor: Alper KANAT <alperkanat@raptiye.org>
# Contributor: Ertugrul HAZAR <ertugrulhazar at gmail dot com>


pkgname=boncuk
pkgver=1.1
pkgrel=2
pkgdesc='Simple English-Turkish dictionary'
url='http://pysozluk-qt.sourceforge.net/'
license=('GPL')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/pysozluk-qt/$pkgname-$pkgver.tar.bz2
        http://downloads.sourceforge.net/pysozluk-qt/$pkgname-dict-0.1.1.tar.bz2
        Boncuk.desktop
        sqlite.patch)
        
md5sums=('7095e5b1de358d79eada315f47915d59'
         'c02201294ec15d45549a05a9455b2811'
         '741a28a69b316d0cbd62c490987fb34a'
         'ee5a68f27e49854917318d31e98d48ac')


### Below line for OpenSuse Build System; comment it if you will compile on your Arch Linux ###
#depends=('qt' 'sqlite')
#makedepends=('qt' 'sqlite')

### Below line for packaging on your Arch Linux machine; comment here and uncomment above if you build it on OpenSuse Build System ###
depends=('qt4' 'sqlite')
makedepends=('qt4' 'sqlite')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/sqlite.patch"
  
  lrelease boncuk.pro
  
  # Below line for OpenSuse Build System; comment it if you will compile on your Arch Linux
  #qmake -o Makefile boncuk.pro
  
  # Below line for packaging on your Arch Linux machine; 
  # comment here and uncomment above if you build it on OpenSuse Build System
  qmake4 -o Makefile boncuk.pro
  
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m755 $startdir/src/$pkgname-$pkgver/bin/boncuk $startdir/pkg/usr/bin/boncuk
  install -D -m755 $startdir/src/$pkgname-dict-0.1.1/boncuk.db $startdir/pkg/usr/share/boncuk/boncuk.db
  install -D -m644 $startdir/src/$pkgname-$pkgver/resources/boncuk.png $startdir/pkg/usr/share/pixmaps/boncuk.png
  install -D -m644 $startdir/Boncuk.desktop $startdir/pkg/usr/share/applications/Boncuk.desktop
}
