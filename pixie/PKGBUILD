# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: flixie <69one@gmx.net>
# Contributor: ezzetabi
pkgname=pixie
pkgver=2.2.6
pkgrel=3
pkgdesc="Open source RenderMan renderer for generating photorealistic images"
url="http://www.renderpixie.com/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('openexr' 'libgl' 'mesa' 'libtiff' 'libpng' 'libxext')
optdepends=('fltk: for building show')
options=(!libtool)
source=("http://downloads.sourceforge.net/sourceforge/pixie/Pixie-src-$pkgver.tgz" \
        "Pixie-src-2.2.6-zlib-fix.patch" "Pixie-src-2.2.6-bison3.patch")
md5sums=('e2063e35d88c25c4b22b954af31ad87d'
         'b650a617828fcffdfe057a9c96d64d5e'
         '530e6f98f5f2fed1158afde0f4f0d29e')

prepare() {
  cd "$srcdir/Pixie"
  # work around bug in bison 3.0.2
  # taken from https://abf.io/import/pixie/tree/rosa2014.1
  patch -Np1 < "$srcdir/Pixie-src-2.2.6-bison3.patch"
  # fix build with current zlib
  # taken from https://abf.io/import/pixie/tree/rosa2014.1
  patch -Np0 < "$srcdir/Pixie-src-2.2.6-zlib-fix.patch"
}

build() {
  cd "$srcdir/Pixie"

  # work around bug in bison, part 2
  #export PATH="$srcdir:$PATH"

  ./configure --prefix=/usr --mandir=/usr/share \
    --disable-selfcontained --enable-openexr-threads
  
  make
}

package() {
  cd "$srcdir/Pixie"
  make DESTDIR="$pkgdir" install
}
