# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gegl-devel
pkgname=$_pkgname-git
pkgver=GEGL_0_2_0.1505.g3b2925d
pkgrel=1
pkgdesc="Graph based image processing framework"
arch=('i686' 'x86_64')
url="http://www.gegl.org/"
license=('GPL3' 'LGPL3')
depends=('gtk2' 'babl')
makedepends=('intltool' 'ruby' 'lua' 'openexr' 'ffmpeg' 'librsvg' 'jasper' 'exiv2')
optdepends=('openexr: for using the openexr plugin' \
            'ffmpeg: for using the ffmpeg plugin' \
            'librsvg: for using the svg plugin' \
            'jasper: for using the jasper plugin')
options=('!libtool')
replaces=('gegl')
provides=('gegl' 'gegl=0.3.0' 'gegl-devel=0.3.0')
conflicts=('gegl')
source=('git://git.gnome.org/gegl')
sha256sums=('SKIP ')

pkgver() {
  cd "$srcdir/gegl"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/gegl"
  ./autogen.sh  --prefix=/usr  --with-sdl --with-openexr --with-librsvg \
    --with-libavformat --with-jasper --disable-docs
  make
}

package() {
  cd "$srcdir/gegl"
  make DESTDIR="${pkgdir}" install
}
