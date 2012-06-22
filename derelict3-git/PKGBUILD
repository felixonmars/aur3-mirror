pkgname=derelict3-git
pkgver=20120622
pkgrel=1
pkgdesc="Derelict3"
url=("https://github.com/aldacron/Derelict3")
arch=('i686' 'x86_64')
license=('Boost')
depends=('dmd')
makedepends=('git')
conflicts=('derelict' 'derelict2-svn')
provides=('derelict')
optdepends=('glfw3-git' 'sdl-hg' 'devil' 'openal' 'freetype2' 'libgl')

_gitroot="https://github.com/aldacron/Derelict3.git"
_gitname="Derelict3"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname/build"

  dmd -ofbuild "build.d"
  ./build

  mkdir -p "$pkgdir/usr/"
  if [ -f "../lib/SAVEME.txt" ] ; then
    rm "../lib/SAVEME.txt"
  fi
  cp -r "../lib" "$pkgdir/usr/"

  mkdir -p "$pkgdir/usr/include/d"
  cp -r "../import/derelict" "$pkgdir/usr/include/d/"
}
