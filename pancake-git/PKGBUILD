# Contributor: Simon Brakhane <simon.brakhane at web dot de>

pkgname=pancake-git
pkgver=20121211
pkgrel=1
pkgdesc='pancake is a highly configurable, modular, themeable, GTK+-2.0-driven panel for X11'
url='https://github.com/lynxed/pancake'
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'libwnck' 'confuse' 'libx11' 'glib')
makedepends=('git')
conflicts=('pancake')

_gitroot='https://github.com/lynxed/pancake.git'
_gitname="pancake"

build() {
  cd ${srcdir}
  export LDFLAGS="$LDFLAGS -lgmodule-2.0 -lX11"
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build
  ./bootstrap
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
} 
