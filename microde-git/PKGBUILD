# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=microde-git
pkgver=20091130
pkgrel=1
pkgdesc="Microde: a micro-desktop environment"
arch=('i686' 'x86_64')
url="http://github.com/Dieterbe/microde/"
license=('GPL3')
depends=('xorg-server-utils' 'xbindkeys' 'xscreensaver')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/Dieterbe/microde.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

	make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:

