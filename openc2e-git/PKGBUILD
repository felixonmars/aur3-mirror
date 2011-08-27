# Contributor: Bruno Vieira <mail@bmpvieira.com>
pkgname=openc2e-git
pkgver=20091118
pkgrel=1
pkgdesc="the open-source Creatures engine"
arch=('i686' 'x86_64')
url="http://openc2e.org"
license=('GPL')
depends=('perl' 'bison' 're2c' 'zlib' 'perl-yaml' 'openal' 'freealut' 'sdl_net' 'sdl_ttf' 'sdl_gfx' 'boost' 'cmake')
optdepends=("qt: for the GUI")
makedepends=('gcc' 'git' 'cmake')
provides=('openc2e')
source=()
md5sums=()
_gitroot='git://github.com/ccdevnet/openc2e.git'
_gitname='openc2e'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout /done or server timeout"
  msg "Starting make..."
  
  cd $_gitname
  mkdir build 
  cd build
  cmake .. || return 1
  make || return 1
  install -Dm755 $startdir/src/$_gitname/build/openc2e $startdir/pkg/usr/bin/openc2e
}
