# Maintainer: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
#
# This PKGBUILD derives from official clucene PKGBUILD so below is a credits list for that one.
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is RelWithDebInfo to help with debugging.

_buildtype="RelWithDebInfo"

##############################################################

pkgname=clucene-git
pkgver=20110621
pkgrel=1
pkgdesc="CLucene is a C++ port of Lucene: A high-performance, full-featured text search engine."
arch=('i686' 'x86_64')
url="http://clucene.sourceforge.net"
license=('APACHE' 'LGPL')
depends=('gcc-libs' 'zlib' 'boost-libs')
makedepends=('boost' 'cmake' 'git')
provides=('clucene=2.3.3.4')
conflicts=('clucene')
options=('!strip')
changelog=ChangeLog

if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

_gitroot="git://clucene.git.sourceforge.net/gitroot/clucene/clucene"
_gitname="clucene"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "Local files are updated."
  else
    git clone --depth 1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/$_gitname ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=${_buildtype}
  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=${pkgdir} install
}
