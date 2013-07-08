# Maintainer: jorissteyn <jorissteyn@gmail.com>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: garfiield <garfiield at garfiield dot net>
pkgname=dvtm-git
pkgver=v0.9.5.gfb25efb
pkgrel=1
pkgdesc='Tiling window management for the console'
arch=('i686' 'x86_64')
url='http://www.brain-dump.org/projects/dvtm/'
license=('MIT')
depends=('ncurses')
conflicts=('dvtm')
provides=('dvtm')
makedepends=('git')
source=('git://repo.or.cz/dvtm.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/dvtm
  git describe --tags --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir"/dvtm

  # you have two options configure dvtm:
  #  * modify config.def.h in srcdir/dvtm
  #  * copy srcdir/dvtm/config.def.h and place it in
  #    the root folder of this package
  if [ -f ../../config.def.h ]; then
    cp ../../config.def.h .
  fi

  make
}

package() {
  cd "$srcdir"/dvtm

  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$_gitname/README"
}

# vim:set ts=2 sw=2 et:
