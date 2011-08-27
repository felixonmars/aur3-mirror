# Contributor: Xilon <xilonmu@gmail.com>
pkgname='ekg-cvs'
pkgver=20080116
pkgrel=1
pkgdesc='Text-mode Gadu-Gadu client'
url='http://ekg.chmurka.net'
license=('GPL')
arch=('i686' 'x86_64')
depends=('aspell' 'libjpeg' 'zlib' 'openssl' 'libungif' 'libgadu')
makedepends=('cvs')
provides=('ekg')
conflicts=('ekg')
source=()
md5sums=()

_cvsroot=':pserver:anonymous:@ekg.chmurka.net:/home/cvs'
_cvsmod='ekg'

build() {
  cd "$startdir/src"

  msg "Connecting to ekg.chmurka.net CVS server..."
  cvs -z3 -d $_cvsroot co -D $pkgver -f -P "$_cvsmod"
 
  cd "$_cvsmod"
  NOCONFIGURE=1 ./autogen.sh
  cd "$startdir/src"
  msg "CVS checkout done or server timeout"
  msg "Starting make..."
  cp -r "$_cvsmod" "${_cvsmod}-build"
  cd "${_cvsmod}-build"

  sed -i 's#gg%s#ekg%s#' src/ekg.c

  ./configure --prefix=/usr \
    --enable-aspell \
    --with-pthread \
    --enable-libgadu-openssl \
    --disable-static \
    --enable-dynamic \
    --enable-shared \
    --enable-ioctld || return 1

  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -r "$startdir/src/${_cvsmod}-build"
}
