# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=oalwrapper-git
_gitname="OALWrapper"
pkgver=55.e20579d
pkgrel=1
pkgdesc="A wrapper library for OpenAL. Makes using OpenAL a lot easier."
arch=('i686' 'x86_64')
url="http://github.com/FrictionalGames/OALWrapper"
license=('custom:ZLIB')
depends=('openal' 'libvorbis' 'libogg' 'sdl')
makedepends=('git' 'cmake')
provides=('oalwrapper')
conflicts=('oalwrapper')
source=('git://github.com/FrictionalGames/OALWrapper')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  echo '
    install(TARGETS OALWrapper
        ARCHIVE DESTINATION lib
    )

    install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/OALWrapper
            DESTINATION include
    )' >>CMakeLists.txt
  rm -fr include/AL
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

