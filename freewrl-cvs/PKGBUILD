# Maintainer: Christian Bühler <christian@cbuehler.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
pkgname=freewrl-cvs
pkgver=20120805
pkgrel=1
pkgdesc="VRML viewer"
arch=('i686' 'x86_64')
url="http://freewrl.sourceforge.net/"
license=('GPL')
depends=('java-runtime' 'libxaw' 'glew' 'freeglut' 'curl' 'freetype2' 'imlib2' 'sox'
	 'unzip' 'imagemagick' 'libxml2' 'ttf-bitstream-vera' 'lesstif' 'js')
makedepends=('cvs' 'java-environment' 'xulrunner')
provides=('freewrl')
conflicts=('freewrl')
options=(!libtool)

_cvsroot=:pserver:anonymous:@freewrl.cvs.sourceforge.net:/cvsroot/freewrl
_cvsmod=freewrl/freex3d

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [[ -d "$_cvsmod/CVS" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d "$_cvsroot" co -D "$pkgver" -f "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  . /etc/profile.d/jre.sh
  . /etc/profile.d/jdk.sh
  export JAVASCRIPT_ENGINE_CFLAGS="-I/usr/include/js -DXP_UNIX -DJS_THREADSAFE $(pkg-config --cflags nspr)"
  export JAVASCRIPT_ENGINE_LIBS="$(pkg-config --libs nspr) -lmozjs185"
  autoreconf --install
  ./configure \
    --prefix=/usr --with-fontsdir=/usr/share/fonts/TTF --enable-libeai \
    --enable-libcurl --with-expat=/usr --with-target=x11 --enable-plugin \
    --disable-mozilla-js --enable-xulrunner-js --disable-firefox-js \
    --disable-seamonkey-js
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
