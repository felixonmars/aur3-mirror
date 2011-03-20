pkgname=gegl-git-master
pkgver=0.1.7
pkgrel=1
arch=('i686' 'x86_64')

pkgdesc='GEGL (Generic Graphics Library) is a graph based image processing framework.'
license=('GPL')
url='http://www.gegl.org/'
#For CHANGELOG: http://gimptest.flamingtext.com:8080/job/gegl-distcheck/changes
conflicts=('gegl' 'gegl-git')
provides=('gegl')
depends=('glib2>=2.10' 'babl-git-master' 'libpng' 'ruby')
optdepends=('sdl' 'libjpeg' 'openexr' 'pango' 'librsvg' 'graphviz')

source=("http://db.tt/b79BzaY")

md5sums=('4b3b37cb7160c14161afb469b5b490ba')

build() {
	cd $srcdir/gegl-$pkgver
	./configure --prefix=/usr --disable-docs
	make
}
package(){
	cd $srcdir/gegl-$pkgver
	make DESTDIR="$pkgdir" install
}
