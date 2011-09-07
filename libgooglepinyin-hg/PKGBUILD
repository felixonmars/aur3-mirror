pkgname=libgooglepinyin-hg
pkgver=37
pkgrel=1
pkgdesc="A fork from google pinyin on android"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libgooglepinyin"
license=('APACHE')
makedepends=('mercurial' 'cmake')
provides=('libgooglepinyin=0.1.1')
conflicts=('libgooglepinyin')

_hgroot=https://libgooglepinyin.googlecode.com/hg/
_hgrepo=libgooglepinyin

build(){
  cd "$srcdir"

  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -rf "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr . \
      -DENABLE_STATIC=Off
  make DESTDIR=${pkgdir} install
}
