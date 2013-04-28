# Maintainer: Moritz Kiefer <moritz.kiefer@gmail.com>

pkgname=radium-git
pkgver=20130428
pkgrel=2
pkgdesc="A graphical music editor. A next generation tracker."
arch=('i686' 'x86_64')
url="http://users.notam02.no/~kjetism/radium/"
license="GPLv2"
provides="radium"
depends=('qt4' 'libxaw' 'python2' 'alsa-lib' 'jack' 'libsamplerate' 'liblrdf' \
         'libsndfile' 'ladspa' 'glib2' 'calf' 'libltdl')
makedepends=('')

_gitroot="git://github.com/kmatheussen/radium.git"
_gitname="radium"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname

  touch audio/*.cpp common/gfx_op_queue_generated.c common/visual_op_queue_proc.h

  make packages

  BUILDTYPE=RELEASE ./build_linux.sh
}

package() {
  cd "$srcdir/$_gitname"
  make install PREFIX=/usr DESTDIR=$pkgdir
}
