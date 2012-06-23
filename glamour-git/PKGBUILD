pkgname=glamour-git
pkgver=20120623
pkgrel=1
pkgdesc='OpenGL wrapper for the D programming language'
arch=(i686 x86_64)
url='https://github.com/Dav1dde/glamour'
license=('MIT')
depends=('derelict' 'gl3n')
makedepends=('git')
provides=('glamour')

derelictver=Derelict3

_gitroot="https://github.com/Dav1dde/glamour.git"
_gitname="glamour"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  wget -O stb_image.d https://bitbucket.org/dav1d/gl-utils/raw/tip/stb_image/stb_image.d

  cd "$_gitname"

  msg 'Running make'

  make PREFIX=/usr DCFLAGS+="-version=Derelict3 -version=stb -I../ -version=gl3n `pkg-config --libs --cflags gl3n`"
  mkdir -p $pkgdir/usr
  make install PREFIX=$pkgdir/usr
}
