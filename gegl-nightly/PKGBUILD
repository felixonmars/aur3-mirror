pkgname=gegl-nightly
pkgver=0.1.3
pkgrel=1
arch=('i686' 'x86_64')

pkgdesc='GEGL (Generic Graphics Library) is a graph based image processing framework.'
license=('GPL')
url='http://www.gegl.org/'
#http://www.chromecode.com/2009/10/nightly-gimp-gegl-babl-tarball-builds.html

conflicts=('gegl' 'gegl-git')
provides=('gegl')
depends=('glib2>=2.10' 'babl-nightly' 'libpng' 'ruby')
optdepends=('sdl' 'libjpeg' 'openexr' 'pango' 'librsvg' 'graphviz')

source=("ftp://gimptest.flamingtext.com/pub/nightly-tarballs/gegl-$pkgver.tar.bz2")
#source=("http://www.pumbur.net/file/gegl-$pkgver.tar.bz2")
md5sums=('ee691bf4641716bb3317f93c3ace051c')

build() {
	cd $srcdir/gegl-$pkgver
	./configure --prefix=/usr --disable-docs
	make
}
package(){
	cd $srcdir/gegl-$pkgver
	make DESTDIR="$pkgdir" install
}
