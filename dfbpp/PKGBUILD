# Contributor: Maik Opitz <maik@fjordblau.de>

pkgname=dfbpp
pkgver=1.2.0
pkgrel=1
arch=(i686 x86_64)
pkgdesc="DFB++ for DirectFB"
url="http://www.directfb.de/"
license=('GPL')
depends=('gcc' 'directfb>=1.2.0')
source=(http://www.directfb.org/downloads/Extras/DFB++-$pkgver.tar.gz \
        dfbpp.diff)
md5sums=('80b94caff14e2e59be762cad8018e655'
         '449bed8554f7d0841c758dad54aa2efe')

build() {

    cd $startdir/src/DFB++-$pkgver
    
    patch -p1 -i ../dfbpp.diff

    ./configure --prefix=/usr

    make || return 1

    make DESTDIR=/$startdir/pkg install || return 1
}
