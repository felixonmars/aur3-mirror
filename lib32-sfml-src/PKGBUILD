# Maintainer: Kevin Ott <supercodingmonkey at gmail dot com>

pkgname=lib32-sfml-src
pkgver=2.1
pkgrel=1
pkgdesc='A simple, fast, cross-platform, and object-oriented multimedia API (32-bit)'
arch=('x86_64')
url='http://www.sfml-dev.org/'
license=('zlib')
provides=('lib32-sfml')
depends=('lib32-libsndfile' 'lib32-libxrandr' 'lib32-libjpeg' 'lib32-openal' 'lib32-glew' 'lib32-freetype2' 'sfml')
makedepends=('lib32-mesa' 'cmake')
source=("http://www.sfml-dev.org/download/sfml/${pkgver}/SFML-${pkgver}-sources.zip")
md5sums=('2de81448733f3f46964f23f41cd42e92')

build() {
  cd "$srcdir/SFML-${pkgver}"

  export CFLAGS='-m32'
  export CXXFLAGS='-DGLXContextID=XID -m32'
  export LDFLAGS='-m32'
  
  mkdir build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DSFML_BUILD_EXAMPLES=0 \
      -DSFML_BUILD_DOC=0
  make
}

package() {
  cd "$srcdir/SFML-${pkgver}"/build
  
  mkdir -p "$pkgdir/usr/lib32"
  cp -a lib/*.so{,.*} "${pkgdir}/usr/lib32/"

  install -Dm644 ../license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
