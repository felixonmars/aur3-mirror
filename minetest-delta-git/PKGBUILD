# Maintainer: wido <widomaker2k7 @ gmail.com>

pkgname=minetest-delta-git
pkgver=20110710
pkgrel=2
pkgdesc="fork of Minetest-c55 with additional experimental features"
arch=('i686' 'x86_64')
url="https://github.com/erlehmann/minetest-delta"
license=('GPL2')
makedepends=('mercurial' 'cmake' 'irrlicht' 'libx11' 'mesa' 'libjpeg' 'bzip2' 'libpng' 'zlib')
depends=('libx11' 'libjpeg' 'bzip2' 'libpng' 'zlib')
conflicts=('minetest')
provides=('minetest')

_gitname="minetest-delta"
_gitroot="git://github.com/erlehmann/minetest-delta.git"

build() {
  msg "Connecting to github.com GIT server...."

if [ -d ${srcdir}/$_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
else
   git clone $_gitroot
fi

msg "GIT checkout done or server timeout"
msg "Starting make..."

rm -rf ${srcdir}/${_gitname}-build
cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

cd ${srcdir}/${_gitname}-build

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
}
package() {
    cd ${srcdir}/${_gitname}-build
    make -j2 DESTDIR=${pkgdir}/ install
}
