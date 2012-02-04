# Maintainer: Roger Duran <rogerduran at gmail.com>
pkgname=construder-git
pkgdesc="Construder is a 3D game that takes place in a completely modifiable world that is built from small cubes, inspired by Minecraft/Infiniminer."
pkgver=20110927
pkgrel=1
arch=(x86_64)
url="http://ue.o---o.eu/"
license=('AGPL')
depends=(perl perl-alien-sdl perl-opengl perl-common-sense perl-json perl-anyevent perl-compress-lzf perl-sdl perl-list-opengl perl-object-event perl-file-sharedir-install perl-file-sharedir-par perl-ev)
makedepends=('git' 'perl-module-install')

_gitroot="http://github.com/elmex/Construder.git"
_gitname="construder"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
