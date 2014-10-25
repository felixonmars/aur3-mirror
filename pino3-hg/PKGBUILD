# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: nofrak <nofrak at polattack.com>
pkgname=pino3-hg
pkgver=40
pkgrel=4
pkgdesc="A simple and fast client for Twitter and Identi.ca. Experimental build"
arch=('i686' 'x86_64')
url="http://pino-app.appspot.com/"
license=('LGPL3')
depends=('libgee06' 'libnotify' 'libwebkit>=1.0' 
'libunique>=1.0' 'vala-012' 'gtkspell>=2.0' 'rest')
optdepends=('libindicate: indicator support')
makedepends=('mercurial' 'cmake')
provides=('pino')
conflicts=('pino')
source=('gthread.patch')
md5sums=('66edc5aa830bdeca4b9212dc21b20611')
_hgroot=http://bitbucket.org/troorl
_hgrepo=pino3

prepare(){
  cd $srcdir
  if [ -d ${_hgrepo} ]; then
    rm -r ${_hgrepo}
  fi
  hg clone "$_hgroot/$_hgrepo"
  cd ${_hgrepo}
  echo "Removing old build"
  if [ -d "build" ]; then
    rm -r build
  fi
  sed -i 's/NAMES valac/NAMES valac-0.12/' cmake/FindVala.cmake
  echo "set (CMAKE_C_FLAGS \"-ggdb -lm\")" | tee >> CMakeLists.txt
  patch -Np1 -i ../gthread.patch
}

build() {
  mkdir "$srcdir/$_hgrepo/build"
  cd "$srcdir/$_hgrepo/build"
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DUBUNTU_ICONS=OFF -DENABLE_DEBUG=OFF && make
} 
package() {
  cd "$srcdir/$_hgrepo/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
