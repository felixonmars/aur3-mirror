# Contributor: Juan Pablo González Tognarelli <lord_jotape@yahoo.com.ar>
 
pkgname=pdfcube
pkgver=0.0.4
pkgrel=1
pkgdesc="PDF Cube uses the OpenGL API to add 3D spinning cube page transitions to PDF documents." 
url="http://code.100allora.it/pdfcube" 
depends=(gtkglext poppler poppler-glib freeglut boost freetype2)
source=(http://code.100allora.it/releases/pdfcube/$pkgname-$pkgver.tar.gz)
md5sums=('ce80c37b8e8b43072119442046bd31f5')
arch=('i686' 'x86_64')
license="GPL2" 

build() { 
     cd $startdir/src/$pkgname-$pkgver
     ./configure --prefix=/usr
     make || return 1 
     make DESTDIR=$startdir/pkg install 
}  
