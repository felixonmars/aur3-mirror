# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Jason Melton <jason.melton@gmail.com>

pkgname=stuntrally
pkgver=1.9
pkgrel=1
pkgdesc="Stunt Rally game with track editor, based on VDrift and OGRE"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://code.google.com/p/vdrift-ogre"
depends=('libvorbis' 'mygui' 'sdl' 'enet' 'bullet')
makedepends=('cmake' 'boost')
source=(src_${pkgver}.tar.gz::https://nodeload.github.com/${pkgname}/stuntrally/tar.gz/${pkgver}
        tracks_${pkgver}.tar.gz::https://nodeload.github.com/${pkgname}/tracks/tar.gz/${pkgver})
md5sums=('3253c5a64a6d3f4fc4b756ea431286de'
         '77e118926c970a445b91d688a4f46799')
sha256sums=('651d10aa00cf73b275198f08b0360a34ff98e6b520013041863854babeb20da7'
            '9adbc01e322a44b844c0dee1ae51178dc281f0a296286a67764561b6a7cfe97d')
sha384sums=('13d840a75c97356db8a76d579b4bd007c8be3be3e52000b8e933332281425edfe9d94906e42eb449b67567e672dd8ac3'
            '13c1ebe512c54966f4689210a12d401e9507a8b5aad8df33ed4c4af5871a3166d3d6a94eb0eb232850f4a637f57998db')
sha512sums=('702f407e5e7a8788067a1d7e326bc2a09bc0b404f976aa75f01d8d404343e656d6e935fb39a2036009c2283446a2173e90e74e6555a1d6a52700311152ffc527'
            '9ac1b3ebec1f1c429d99840eafac4d2a4110a5f8c20577d829592d2dd21ae914af8e3fe1fa7cabea3115d52120ca0e4be5d1430095af658ada3ca710b675500b')

build() {
  # build the sources
  cd "${srcdir}/stuntrally-${pkgver}/"

  rm -rf build
  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DSHARE_INSTALL="share/stuntrally" ..
  make


  # build the tracks
  cd "${srcdir}/tracks-${pkgver}/"

  rm -rf build
  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  #install the sources
  cd "${srcdir}/stuntrally-${pkgver}/build/"

  make DESTDIR="${pkgdir}" install


  # install the tracks
  cd "${srcdir}/tracks-${pkgver}/build"

  make DESTDIR="${pkgdir}/usr/share/stuntrally/" install

  rm -rf "${pkgdir}/usr/share/stuntrally/tracks/build"
}
