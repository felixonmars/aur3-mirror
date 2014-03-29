#Maintainer: Yichao Yu <yyc1992@gmail.com>
#Contributor: Yichao Yu <yyc1992@gmail.com>

pkgname=lib32-gammaray-libs-qt4-git
pkgver=2.0.1.217.ge11b1fb
_realver=2.1
pkgrel=1
arch=('x86_64')
license=('GPL')
makedepends=('git' 'cmake' 'gcc-multilib')
depends=('lib32-qt4>=4.8' 'lib32-qt4<4.9' "gammaray=${_realver}")
url='http://www.kdab.com/gammaray'
pkgdesc="GammaRay is a tool to poke around in a Qt-application and also to manipulate the application to some extent"
source=(qconfig.h i686.cmake)
md5sums=('89eaf62c5271cd6c268b926bb752a744'
         '15e1e5cfa4443a5e6358faa59ec2605e')
options=('debug' 'strip')

_gitname='GammaRay'

_gitroot='https://github.com/KDAB/GammaRay.git'
_gitref="master"

_fetch_git() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    git clean -fdx
    msg "Fetching branch $_gitref from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitref:$_gitref" --
    msg "Checking out branch $_gitref..."
    git checkout "$_gitref" --
    git reset --hard "$_gitref"
    git clean -fdx
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitref from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitref" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

pkgver() {
  local outfile=/dev/null
  [[ -e /dev/tty ]] && outfile=/dev/tty
  (_fetch_git &> ${outfile})
  cd "$srcdir/$_gitname"

  git describe | sed -e 's/^[^0-9]//' -e 's/-/./g'
}

build() {
  (_fetch_git)

  mkdir -p QtCore
  cp qconfig.h QtCore

  # export multilib parameters
  # and QT_BUILD_KEY workaround
  export LDFLAGS="-L/usr/lib32"
  export CC="gcc -m32 -I$srcdir -I$srcdir/QtCore"
  export CXX="g++ -m32 -I$srcdir -I$srcdir/QtCore"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "$srcdir/$_gitname"

  mkdir -p build
  cd build
  {
    rm -f CMakeCache.txt
    rm -f CMakeFiles/2.8.*/CMakeSystem.cmake
  } &> /dev/null || true

  # force Qt4 build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DGAMMARAY_ENFORCE_QT4_BUILD=ON \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
    -DQT_PLUGINS_DIR=/usr/lib32/qt/plugins \
    -DQT_LIBRARY_DIR=/usr/lib32 \
    -DLIB_INSTALL_DIR=/usr/lib32 \
    -DCMAKE_SYSTEM_LIBRARY_PATH='/lib32;/usr/lib32;/usr/local/lib32' \
    -DCMAKE_IGNORE_PATH='/lib;/usr/lib;/usr/local/lib' \
    -DLIB_SUFFIX=32 \
    -DGAMMARAY_PROBE_ONLY_BUILD=On \
    -DCMAKE_DISABLE_FIND_PACKAGE_Graphviz=On \
    -DCMAKE_DISABLE_FIND_PACKAGE_VTK=On \
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}/i686.cmake"
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/lib"
  mv "${pkgdir}/usr/lib32/gammaray" "${pkgdir}/usr/lib/"
}
