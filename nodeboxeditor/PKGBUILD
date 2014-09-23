# Maintainer: Dominik (Zatherz) Banaszak <zatherz@linux.pl>
pkgname=nodeboxeditor
pkgver=0.7
pkgrel=1
pkgdesc="Nodebox editor for Minetest, a voxel sandbox game inspired by Infiniminer, Minecraft and the like."
url="https://forum.minetest.net/viewtopic.php?f=14&t=2840"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('irrlicht' 'libpng12' 'bzip2' 'libjpeg-turbo' 'mesa-libgl')
makedepends=('cmake')
source=("https://github.com/rubenwardy/NodeBoxEditor/archive/v$pkgver.tar.gz" "filesys.hpp.patch")
md5sums=('cd0b08fd61405b6b5dbeae55a31d1db8' '9832b67827b7bd58184973d862223330')

build() {
  cd "${srcdir}/NodeBoxEditor-${pkgver}"
  patch -i "../../filesys.hpp.patch" "./src/util/filesys.hpp"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make -j2
}

package() {
  cd "${srcdir}/NodeBoxEditor-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mkdir -m 755 "${pkgdir}/usr/share/applications"
  mv "${pkgdir}"/home/*/.local/share/applications/nodeboxeditor.desktop "${pkgdir}/usr/share/applications"
  rm -r "${pkgdir}/home"
  mv "${pkgdir}/usr/bin/nodeboxeditor" "${pkgdir}/usr/share/nodeboxeditor/nodeboxeditor_real"
  echo -e '#!/bin/sh' > "${pkgdir}/usr/bin/nodeboxeditor"
  echo -e "cd /usr/share/nodeboxeditor" >> "${pkgdir}/usr/bin/nodeboxeditor"
  echo -e "./nodeboxeditor_real" >> "${pkgdir}/usr/bin/nodeboxeditor"
  chmod 755 "${pkgdir}/usr/bin/nodeboxeditor"
}

