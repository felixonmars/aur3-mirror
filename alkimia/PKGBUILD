# Contributor: gumper <gumper1034@gmail.com>

pkgname=alkimia	
pkgver=4.3.1
pkgrel=1
pkgdesc="A library with common classes and functionality used by finance applications for the KDE SC."
depends=()
makedepends=('cmake' 'automoc4')
conflicts=()
url=('http://kde-apps.org/content/show.php/libalkimia?content=137323')
license=('LGPL')
arch=('i686' 'x86_64')

source=("http://kde-apps.org/CONTENT/content-files/137323-libalkimia-$pkgver.tar.bz2")
md5sums=('73d7f1365118019030b2045d95c92456')
 
build() 

{
   cd $srcdir/libalkimia-$pkgver
   cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=DebugFull
   make || return 1
   make DESTDIR=$startdir/pkg install || return 1
}
