# Maintainer: Kirill Omelchenko <twisted@online.ua>

pkgname=blobandconquer-git
pkgver=1.11
#uilddir=$pkgname-$pkgver
pkgrel=2
pkgdesc="Blob And Conquer is a 3D shooter with some puzzles. It is the second in the Blobwars series. The Blobs' homeworld is still littered with the alien forces and Bob once again makes it his task to lead the counter attack."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/blobandconquer/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'mesa')
makedepends=('git')
provides=('mblobwars-episode-ii-blob-n-conquer')

_gitpath='git://blobandconquer.git.sourceforge.net/gitroot/blobandconquer/blobandconquer'
_gitname='blobandconquer'

build() {
  msg "Cloning GIT..."
  cd ${srcdir}
  rm -rf ${_gitname}
  git clone ${_gitpath}
  cd ${_gitname}
  msg "Starting make..."

#A hack to make build complete (since no sound and music are provided)
  sed -e /music/d makefile > makefile.tmp
  echo "PAKDIRS = data gfx textures" > makefile
  cat makefile.tmp >> makefile

  rm -f makefile.tmp
  make
}

package() {
  msg "Packaging..."
  cd ${_gitname}
  make install DESTDIR=${pkgdir}

#A hack to make things work
  msg2 "Creating simlink..."
  cd ${pkgdir}
  echo ${PWD}
  mkdir usr/bin
  cd usr/bin
  ln -s ../games/blobAndConquer blobAndConquer
  cd ../games/
  ln -s ../share/games/blobAndConquer/data data
  ln -s ../share/games/blobAndConquer/gfx gfx
  ln -s ../share/games/blobAndConquer/textures textures
  msg2 "Done"
  msg "Done"
}
