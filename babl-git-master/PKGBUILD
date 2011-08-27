pkgname=babl-git-master
pkgver=0.1.5
pkgrel=1
arch=('i686' 'x86_64')
# For changelog http://gimptest.flamingtext.com:8080/job/gimp-distcheck/changes
pkgdesc='babl is a dynamic, any to any, pixel format translation 
library'
license=('GPL')
url='http://www.gegl.org/babl'


conflicts=('babl' 'babl-git')
provides=('babl')
depends=('glib2>=2.10' 'libpng')

source=('http://db.tt/DWAP6HY')
md5sums=('cf72ec54d117db4091e28e947bfee421')
build() {
	cd $srcdir/babl-$pkgver
	./configure --prefix=/usr
	make
}
package(){
	cd $srcdir/babl-$pkgver
	make DESTDIR="$pkgdir" install

}
