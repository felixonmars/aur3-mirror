#Contributor: Sven Kauber <celeon@gmail.com>

pkgname=kimagemapeditor
pkgver=0.9.5.1
pkgrel=2
arch=('i686')
pkgdesc="A tool for KDE that allows you to edit image maps of HTML files"
url="http://www.nongnu.org/kimagemap/index.html"
depends=('kdelibs')
license=('GPL')
source=(http://dl.sourceforge.net/sourceforge/kimagemapeditor/kimagemapeditor-0.9.5.1-kde3.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde
   make || return 1
   make DESTDIR=$startdir/pkg/ install
   cp -a $startdir/pkg/"--prefix"/*  $startdir/pkg/
   rm -r $startdir/pkg/"--prefix"
 }
md5sums=('632b6ac1215115e7b33cf924b88228ba')
