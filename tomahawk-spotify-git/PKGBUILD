# Maintainer: Casey Link <unnamedrambler(at)gmail(dot)com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# What type of build do you want?
# See http://techbase.kde.org/Development/CMake/Addons_for_KDE#Buildtypes to check what is supported.
# Default is DebugFull to help with debugging.

_buildtype="DebugFull"

##############################################################

pkgname=tomahawk-spotify-git
pkgver=20110817
pkgrel=1
pkgdesc="The spotify resolver for tomahawk"
arch=('i686' 'x86_64')
url="http://tomahawk-player.org/"
license=('GPL3')
depends=('qjson' 'libspotify>=0.0.8')
makedepends=('git' 'cmake>=2.8.0')
provides=('tomahawk-spotify')
conflicts=('tomahawk-spotify')
options=(!strip)

# Clean options array to strip pkg if release buildtype is chosen
if [[ ${_buildtype} == "Release" ]] || [[ ${_buildtype} == "release" ]]; then
  options=()
fi

_gitroot="git://github.com/tomahawk-player/tomahawk-resolvers.git"
_gitname="tomahawk-resolvers"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
  else
    git clone --depth 1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname}/spotify ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=${_buildtype}
  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  mkdir -p $pkgdir/usr/bin
  cp spotify_tomahawkresolver $pkgdir/usr/bin
}
