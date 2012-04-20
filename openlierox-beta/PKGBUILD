# Maintainer: kevku <kevku@msn.com>
pkgname=openlierox-beta
pkgver=0.59_beta10
pkgrel=1
pkgdesc="A real-time excessive Worms-clone"
arch=('i686' 'x86_64')
url="http://www.openlierox.net/"
license=('LGPL')
depends=('curl' 'gcc-libs' 'sdl_image' 'sdl_mixer' 'gd' 'hawknl' 'libxml2' 'libzip' 'lua' 'freealut')
makedepends=('cmake' 'boost')
optdepends=('bash: for scripts support'
            'python: for scripts support')
conflicts=('openlierox' 'openlierox-svn')
source=("http://downloads.sourceforge.net/${pkgname%-beta}/OpenLieroX_$pkgver.src.tar.bz2")
md5sums=('ef92cd2ed3a347c804b1d06edf93b7a6')

build() {
  cd "$srcdir"/OpenLieroX

  #sed -i '1i #include <sys/stat.h>' src/breakpad/external/src/common/linux/file_id.cc
  sed -i 's|/usr/share/games|/usr/share|g' include/FindFile.h
  sed -i 's|pthread_setname_np(name.c_str());|pthread_setname_np(pthread_self(), name.c_str());|g' src/common/SystemFunctions.cpp
  sed -i '1i #include <cstring>' src/gusanos/objects_list.h

  [[ -d build ]] && rm -r build 
  mkdir build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSTEM_DATA_DIR=/usr/share \
		-DHAWKNL_BUILTIN=OFF \
		-DBREAKPAD=OFF \
		-DLIBLUA_BUILTIN=OFF \
		-DBOOST_LINK_STATIC=ON \
		-DDEBUG=OFF \
		-DHASBFD=OFF
  make
}

package() {
  cd "$srcdir"/OpenLieroX

  # Awesome, they are using CMake but they do not want it to also make the install.

  # install binary
  install -Dm755 bin/${pkgname%-beta} "$pkgdir"/usr/bin/${pkgname%-beta}

  # install data
  install -m755 -d "$pkgdir"/usr/share/OpenLieroX
  cp -r share/gamedir/* "$pkgdir"/usr/share/OpenLieroX/
  find "$pkgdir"/usr/share/OpenLieroX -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share/OpenLieroX -type f -exec chmod 644 {} +

  # install manual
  install -Dm644 doc/${pkgname%-beta}.6 "$pkgdir"/usr/share/man/man6/${pkgname%-beta}.6

  # install icon
  install -Dm644 share/OpenLieroX.svg \
    "$pkgdir"/usr/share/pixmaps/OpenLieroX.svg

  # install .desktop file
  install -Dm644 share/${pkgname%-beta}-${pkgname%-beta}.desktop \
    "$pkgdir"/usr/share/applications/${pkgname%-beta}.desktop
}
