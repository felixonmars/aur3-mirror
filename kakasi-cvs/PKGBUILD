# Contributor: muflax <muflax@gmail.com>

pkgname=kakasi-cvs
pkgver=20090221
pkgrel=1
pkgdesc="Convert Kanji characters to Hiragana, Katakana or Romaji"
arch=('i686' 'x86_64')
url="http://kakasi.namazu.org/"
license=('GPL')
# rather trivial patch to recognize 今日は as きょうは
source=("今日は.patch")
md5sums=()
provides=(kakasi)
conflicts=(kakasi)
makedepends=(cvs)
_cvsroot=":pserver:anonymous@cvs.namazu.org:/storage/cvsroot"
_cvsmod="kakasi"

build() {
  cd ${srcdir}

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi
  ./autogen.sh

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf ../$_cvsmod-build
  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build

  patch -p1 -i $srcdir/今日は.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

md5sums=('648c36bd7adba687ac8d123cf29b7cdc')
