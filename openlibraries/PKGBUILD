# Maintainer:
# Contributor: Ali H. Caliskan <ali.h.caliskan@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=openlibraries
pkgver=0.4.0
pkgrel=3
pkgdesc="Powerful and cross-platform set of libraries for easily creating, testing, and deploying rich media applications"
arch=('i686' 'x86_64')
url="http://www.openlibraries.org/"
license=('GPL')
depends=('boost' 'glew' 'freeglut' 'libgl' 'mlt++' 'openal' 'openexr' 'sqlite3')
source=(http://kent.dl.sourceforge.net/sourceforge/openlibraries/openlibraries-0.4.0.tar.gz)
md5sums=('e9e8007e69fae777e3113efcb66bf378')
options=(!libtool)

build() {
  cd $srcdir/${pkgname}-${pkgver}/

  # Make FFmpeg optional

  ./configure --prefix=/usr --disable-debug --disable-cg --disable-gelato \
      --disable-quicktime --enable-sqlite3 --enable-openal --enable-gpl \
      --with-x --with-boostthreadruntime=mt --with-pythonversion=2.5 --disable-libavformat

  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
