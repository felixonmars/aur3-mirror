# Maintainer: Mio Iwakura <mio.iwakura@gmail.com>

pkgname=dsfml-c-git
pkgdesc="The back end for DSFML"
license=('custom:dsfml')
pkgver=r21.fe136e0
pkgrel=1
depends=('glew' 'libjpeg-turbo' 'openal' 'libsndfile')
makedepends=('cmake' 'git')
provides=('dsfml-c')
arch=('i686' 'x86_64')
url=('https://github.com/Jebbs/DSFML-C')
source=("$pkgname::git://github.com/Jebbs/DSFML-C.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname}"
  cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${pkgname}"
  install -Dm644 "DSFML License.txt"      "${pkgdir}/usr/share/licenses/${pkgname}/DSFML License.txt"
  install -Dm644  "SFML License.txt"      "${pkgdir}/usr/share/licenses/${pkgname}/SFML License.txt"
  cd ./lib
  install -Dm755 libdsfml-system.so.2.0   "${pkgdir}/usr/lib/libdsfml-system.so.2.0" 
  install -Dm755 libdsfml-audio.so.2.0    "${pkgdir}/usr/lib/libdsfml-audio.so.2.0" 
  install -Dm755 libdsfml-graphics.so.2.0 "${pkgdir}/usr/lib/libdsfml-graphics.so.2.0" 
  install -Dm755 libdsfml-network.so.2.0  "${pkgdir}/usr/lib/libdsfml-network.so.2.0" 
  install -Dm755 libdsfml-window.so.2.0   "${pkgdir}/usr/lib/libdsfml-window.so.2.0" 

  ln -s -T libdsfml-system.so.2.0         "${pkgdir}/usr/lib/libdsfml-system.so.2"
  ln -s -T libdsfml-audio.so.2.0          "${pkgdir}/usr/lib/libdsfml-audio.so.2"
  ln -s -T libdsfml-graphics.so.2.0       "${pkgdir}/usr/lib/libdsfml-graphics.so.2"
  ln -s -T libdsfml-network.so.2.0        "${pkgdir}/usr/lib/libdsfml-network.so.2"
  ln -s -T libdsfml-window.so.2.0         "${pkgdir}/usr/lib/libdsfml-window.so.2"
                                                                                        
  ln -s -T libdsfml-system.so.2.0         "${pkgdir}/usr/lib/libdsfml-system.so"
  ln -s -T libdsfml-audio.so.2.0          "${pkgdir}/usr/lib/libdsfml-audio.so"
  ln -s -T libdsfml-graphics.so.2.0       "${pkgdir}/usr/lib/libdsfml-graphics.so"
  ln -s -T libdsfml-network.so.2.0        "${pkgdir}/usr/lib/libdsfml-network.so"
  ln -s -T libdsfml-window.so.2.0         "${pkgdir}/usr/lib/libdsfml-window.so"
}

# vim:set ts=2 sw=2 et:
