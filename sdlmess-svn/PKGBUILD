# Contributor: Anton Shestakov <engored*ya.ru>
# Maintainer: Anton Shestakov <engored*ya.ru>

pkgname=sdlmess-svn
pkgver=20688
pkgrel=1
pkgdesc='A port of the popular Multiple Emulator Super System using SDL, SVN version.'
url='http://www.mess.org/'
license=('custom:MAME License')
arch=('i686' 'x86_64')
depends=('sdl>=1.2.11' 'sdl_ttf' 'libxinerama' 'gconf' 'zlib' 'expat')
makedepends=('svn' 'python2')
[ "$CARCH" = 'i686' ] && makedepends=('svn' 'nasm')
conflicts=('sdlmess')
provides=('sdlmess')
source=(sdlmess.sh)
md5sums=('141069e7019da5e33414dc8d4c421150')
install=sdlmess.install

_svntrunk=svn://dspnet.fr/mame/trunk/
_svnmod=mame

build() {
  cd "$srcdir"

  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg 'SVN checkout done or server timeout'
  msg 'Starting make...'

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # These changes allow GCC 4.2+ to compile SDLMESS
  sed -e 's|CCOMFLAGS += -Werror|CCOMFLAGS += |' \
    -e 's|-Wno-unused-functions|-Wno-unused|' \
    -i makefile

  # Adjusting make options according to target architecture
  if [ "$CARCH" == 'x86_64' ]; then
    echo 'Compiling for AMD64...'
    make TARGET=mess AMD64=1 PTR64=1 SUFFIX64='' BUILD_ZLIB=0 BUILD_EXPAT=0 PYTHON=python2 ARCHOPTS="$CFLAGS"
  elif [ "$CARCH" == 'i686' ]; then
    echo 'Compiling for i686...'
    make TARGET=mess I686=1 BUILD_ZLIB=0 BUILD_EXPAT=0 ARCHOPTS="$CFLAGS"
  else
    echo 'Compiling for i386...'
    make TARGET=mess PM=1 BUILD_ZLIB=0 BUILD_EXPAT=0 ARCHOPTS="$CFLAGS"
  fi
}

package() {
  cd "$srcdir/$_svnmod-build"
    
  # Installing the wrapper script
  install -Dm755 "$srcdir/sdlmess.sh" "$pkgdir/usr/bin/sdlmess"

  # Installing binaries
  install -Dm755 mess "$pkgdir/usr/share/sdlmess/sdlmess"

  # Installing extra bits
  install -d "$pkgdir/usr/share/sdlmess/artwork"
  install -m644 artwork/* "$pkgdir/usr/share/sdlmess/artwork/"
  install -d "$pkgdir/usr/share/sdlmess/hash"
  install -m644 hash/* "$pkgdir/usr/share/sdlmess/hash/"
  install -d "$pkgdir/usr/share/sdlmess/keymaps"
  install -m644 keymaps/* "$pkgdir/usr/share/sdlmess/keymaps/"

  # The license
  install -Dm644 docs/license.txt "$pkgdir/usr/share/licenses/custom/sdlmess/license.txt"
}
