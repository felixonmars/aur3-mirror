# Maintainer: DaZ <daz.root+arch@gmail.com>

pkgname=raceintospace-git
pkgver=a8f311b
pkgrel=1
pkgdesc="A free software version of the Liftoff! board game by Fritz Bronner"
arch=(i686 x86_64)
url="http://www.raceintospace.org/"
license=("GPL")
depends=( 'sdl' 'libvorbis' 'libtheora' 'jsoncpp' 'libpng')
makedepends=('git' 'cmake' 'boost')

source=("git+git://github.com/raceintospace/raceintospace.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/raceintospace"
  git describe --always | sed 's|-|.|g'
}

build() {
    mkdir -p "${srcdir}/build"
    cd "${srcdir}/build"

    cmake "../raceintospace"\
        -DCMAKE_INSTALL_PREFIX="/usr"\
        -DCMAKE_BUILD_TYPE=Release
    make
}
package()  {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
