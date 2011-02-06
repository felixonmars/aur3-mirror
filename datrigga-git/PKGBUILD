# Maintainer: becks <becks@msound.org>

pkgname=datrigga-git
_realname=datrigga
pkgver=20101224
pkgrel=1
pkgdesc="jackd client audio retrigger"
arch=('i686' 'x86_64')
url="https://github.com/carloratm/daTrigga"
license=('GPL')
depends=('gcc' 'binutils' 'libsndfile' 'libsamplerate' 'jack' 'gtkmm>=2.4.0' 'pkg-config>=0.20')
makedepends=('git')
provides=('datrigga')
conflicts=('datrigga')

_gitroot="git://github.com/carloratm/daTrigga.git"
_gitname="daTrigga"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done"
  msg "Starting waf"

  cd "$srcdir/$_gitname"

  #
  # BUILD HERE
  #

  python2 waf configure --prefix=/usr || return 1
  python2 waf build || return 1
}

package() {
  cd "$srcdir/$_gitname"
  DESTDIR="${pkgdir}" python2 waf install
}
