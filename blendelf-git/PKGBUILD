# Maintainer: Tai Chi Minh Ralph Eastwood <tcmreastwod@gmail.com>
pkgname=blendelf-git
pkgver=20110206
pkgrel=1
pkgdesc="BlendELF is an open source 3d game engine"
arch=('i686' 'x86_64')
url="http://blendelf.com/index.html"
license=('ZLIB')
depends=('glfw' 'glew' 'freeimage' 'freetype2' 'openal' 'libvorbis' 'lua' 'bullet' 'enet' 'assimp-git')
makedepends=('git')
provides=('blendelf')
conflicts=('blendelf')
source=(compile.diff)
md5sums=('100818911d4715153399c3a1648bb0fe')

_gitroot="git://github.com/centralnoise/BlendELF.git"
_gitname="blendelf"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin master
    msg "The local files are updated."
  else
    git clone -b master $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  patch -Np1 -i ../compile.diff
  make
  make shared
  make static

  install -Dm755 blendelfd "$pkgdir/usr/bin/blendelfd"
  install -Dm755 blendelf "$pkgdir/usr/bin/blendelf"
  install -Dm755 libblendelf.so "$pkgdir/usr/lib/libblendelf.so"
  install -Dm644 csdk/blendelf.h "$pkgdir/usr/include/blendelf.h"
  #install -Dm755 tools/blender25_pak_exporter_fast.py "$pkgdir/usr/share/blender/scripts/blender25_pak_exporter_fast.py"
  install -Dm755 tools/blender_pak_exporter_fast.py "$pkgdir/usr/share/blender/scripts/blender_pak_exporter_fast.py"
  install -Dm755 docs/api_doc.html "$pkgdir/usr/share/blendelf/docs/api_doc.html"
  install -Dm755 docs/style.css "$pkgdir/usr/share/blendelf/docs/style.css"
  install -Dm755 docs/images/topbanner.jpg "$pkgdir/usr/share/blendelf/docs/images/topbanner.jpg"
} 

# vim:set ts=2 sw=2 et:
