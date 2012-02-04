pkgname=babl-nightly
pkgver=0.1.3
pkgrel=1
arch=('i686' 'x86_64')

pkgdesc='babl is a dynamic, any to any, pixel format translation library'
license=('GPL')
url='http://www.gegl.org/babl'
#http://www.chromecode.com/2009/10/nightly-gimp-gegl-babl-tarball-builds.html

conflicts=('babl' 'babl-git')
provides=('babl')
depends=('glib2>=2.10' 'libpng')

source=("ftp://gimptest.flamingtext.com/pub/nightly-tarballs/babl-$pkgver.tar.bz2")
#source=("http://www.pumbur.net/file/babl-$pkgver.tar.bz2")
md5sums=('95e0c8fcaec55aae870062b96ac7c359')

build() {
	cd $srcdir/babl-$pkgver
	./configure --prefix=/usr
	make
}
package(){
	cd $srcdir/babl-$pkgver
	make DESTDIR="$pkgdir" install
}
