#Maintainer: Gergely Imreh <imrehg(at)gmail(dot)com>
pkgname=io
pkgver=2011.09.12
pkgrel=1
pkgdesc="Io programming language"
arch=(i686 x86_64)
url="http://iolanguage.com/"
license=('BSD')
depends=('pcre' 'libsndfile' 'libxmu' 'freetype2' 'libedit' 'libxml2' 'libtiff' 'libevent' 'yajl' 'libmysqlclient' 'lzo2' 'libpng' 'python2' 'util-linux' 'freeglut' 'libjpeg-turbo' 'libtheora')
makedepends=('gcc' 'cmake')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stevedekorte/io/tarball/${pkgver}")
options=(!makeflags !buildflags)
build() {
  cd "${srcdir}"
  DIR=`find . -maxdepth 1 -type d -name stevedekorte*`
  cd $DIR
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}"
  DIR=`find . -maxdepth 1 -type d -name stevedekorte*`
  cd "$DIR/build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../license/bsd_license.txt "${pkgdir}/usr/share/licenses/${pkgname}/bsd_license.txt"
}
md5sums=('b5c4b4117e43b4bbe571e4e12018535b')
