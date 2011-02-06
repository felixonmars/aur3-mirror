# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=penumbra-overture-git
pkgver=20100525
pkgrel=1
pkgdesc='First person dark adventure game.'
arch=('i686' 'x86_64')
url='http://www.penumbragame.com/'
license=('GPL3')
makedepends=('git' 'cmake>=2.6' 'freealut' 'angelscript2.10' 'nvidia-cg-toolkit' 'newton-dynamics' 'fltk' 'glee' 'sdl_ttf' 'sdl_image' 'libvorbis')
provides=('penumbra-overture-git')
conflicts=('penumbra-overture-ep1-demo penumbra-collection')

_gitroot='git://github.com/FrictionalGames'
_gitname='PenumbraOverture'
_gitname1='OALWrapper'
_gitname2='HPL1Engine'

_build=$_gitname-build

build() {
  msg 'Connecting to GIT servers...'
  for i in $_gitname $_gitname1 $_gitname2 ; do
  if [ -d $i ]; then
    (cd $i && git pull origin)
  else
    git clone $_gitroot/$i.git
  fi
  done
  msg 'GIT checkout done or server timeout'

  rm -rf $_build
  git clone $_gitname $_build
  cd $_build

  unset LDFLAGS

  # fix headers
  sed -i 's|GL/GLee.h|GLee.h|' "$srcdir/HPL1Engine/include/impl/LowLevelGraphicsSDL.h"
  sed -i 's|GL/GLee.h|GLee.h|' "$srcdir/HPL1Engine/include/impl/PBuffer.h"

  cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1

  make || return 1
}

package() {
  cd "$srcdir/$_build"

  install -D overture.bin "$pkgdir/usr/bin/overture"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
