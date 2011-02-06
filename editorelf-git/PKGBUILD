# Maintainer: Tai Chi Minh Ralph Eastwood <tcmreastwod@gmail.com>
pkgname=editorelf-git
pkgver=20110206
pkgrel=1
pkgdesc="EditorELF is an open source editor for BlendELF"
arch=('i686' 'x86_64')
url="http://blendelf.com/index.html"
license=('ZLIB')
depends=('blendelf')
makedepends=('git')
provides=('editorelf')
conflicts=('editorelf')
source=(editorelf)
md5sums=('7ba20aec78d304a7770e7dcec74a33b4')

_gitroot="git://github.com/centralnoise/EditorELF.git"
_gitname="editorelf_"

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
  
  install -Dm755 "$srcdir/editorelf" "$pkgdir/usr/bin/editorelf"
  install -Dm644 deffont.ttf "$pkgdir/usr/share/editorelf/deffont.ttf"
  install -Dm644 init.lua "$pkgdir/usr/share/editorelf/init.lua"
  install -Dm644 config.txt "$pkgdir/usr/share/editorelf/config.lua"
  install -Dm644 scripts/attribute.lua "$pkgdir/usr/share/editorelf/scripts/attribute.lua"
  install -Dm644 scripts/camera.lua "$pkgdir/usr/share/editorelf/scripts/camera.lua"
  install -Dm644 scripts/gui.lua "$pkgdir/usr/share/editorelf/scripts/gui.lua"
  install -Dm644 scripts/scene.lua "$pkgdir/usr/share/editorelf/scripts/scene.lua"
  install -Dm644 scripts/util.lua "$pkgdir/usr/share/editorelf/scripts/util.lua"
  install -Dm644 scripts/widactor.lua "$pkgdir/usr/share/editorelf/scripts/widactor.lua"
  install -Dm644 scripts/widcamera.lua "$pkgdir/usr/share/editorelf/scripts/widcamera.lua"
  install -Dm644 scripts/widcreate.lua "$pkgdir/usr/share/editorelf/scripts/widcreate.lua"
  install -Dm644 scripts/widentity.lua "$pkgdir/usr/share/editorelf/scripts/widentity.lua"
  install -Dm644 scripts/widfile.lua "$pkgdir/usr/share/editorelf/scripts/widfile.lua"
  install -Dm644 scripts/widfiles.lua "$pkgdir/usr/share/editorelf/scripts/widfiles.lua"
  install -Dm644 scripts/widlight.lua "$pkgdir/usr/share/editorelf/scripts/widlight.lua"
  install -Dm644 scripts/widmaterials.lua "$pkgdir/usr/share/editorelf/scripts/widmaterials.lua"
  install -Dm644 scripts/widoptions.lua "$pkgdir/usr/share/editorelf/scripts/widoptions.lua"
  install -Dm644 scripts/widparticles.lua "$pkgdir/usr/share/editorelf/scripts/widparticles.lua"
  install -Dm644 scripts/widphysics.lua "$pkgdir/usr/share/editorelf/scripts/widphysics.lua"
  install -Dm644 scripts/widscene.lua "$pkgdir/usr/share/editorelf/scripts/widscene.lua"
  install -Dm644 scripts/widshaft.lua "$pkgdir/usr/share/editorelf/scripts/widshaft.lua"
  install -Dm644 scripts/widsprite.lua "$pkgdir/usr/share/editorelf/scripts/widsprite.lua"
  install -Dm644 scripts/widtree.lua "$pkgdir/usr/share/editorelf/scripts/widtree.lua"
  install -Dm644 scripts/winfiledialog.lua "$pkgdir/usr/share/editorelf/scripts/winfiledialog.lua"
  install -Dm644 scripts/winproperties.lua "$pkgdir/usr/share/editorelf/scripts/winproperties.lua"
  install -Dm644 scripts/wintoolbox.lua "$pkgdir/usr/share/editorelf/scripts/wintoolbox.lua"
} 

# vim:set ts=2 sw=2 et:
