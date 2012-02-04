# Contributor: Eduard Sukharev <kraplax AT mail DOT ru>
pkgname='nullbyte-plasmoid-svn'
pkgver='r26'
pkgrel='3'
pkgdesc="A plasmoid that shows updates from sites, based on 0byte site engine (currently only welinux.ru)"
arch=('i686' 'x86_64')
url="http://welinux.ru/"
license=('gpl3')
groups=()
depends=(qjson kdelibs)
makedepends=(subversion cmake)
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=()
noextract=()
#generated with 'makepkg -g'
md5sums=()

_svntrunk=http://nullbyte-plasmoid.googlecode.com/svn/trunk
_svnmod=nullbyte-plasmoid

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timed out"
  msg "Generating makefiles..."

  cd $_svnmod

  if [ -d build ]; then
    cd build
  else
    mkdir build && cd build
  fi
  
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=MinSizeRel .. || return 1

  msg "Makefiles successfully generated"
  msg "Building..."

  make || return 1

  msg "Build finished"
  msg "Installing..."

  make DESTDIR=$pkgdir install || return 1

  msg "Cleaning the build directory..."

  cd ../
  rm -rf ${srcdir}/$_svnmod/build
}

# vim:set ts=2 sw=2 et:
