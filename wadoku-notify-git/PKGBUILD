# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: BoscoWitch <boscowitch@boscowitch.de>
# Contributor: BoscoWitch <boscowitch@boscowitch.de>
pkgname=wadoku-notify-git
pkgver=0.3
pkgrel=2
pkgdesc="A wadoku popup translator for selected text."
arch=('i686' 'x86_64')
url="http://wadoku.de/forum/posts/list/1141.page"
license=('GPL')
depends=('gtk')
makedepends=('make' 'gcc' 'git' 'vala' 'gtk')
_gitroot='git://github.com/boscowitch/wadoku-notify.git'
source=()
md5sums=()

build() {
  git clone $_gitroot
  cd "$srcdir/wadoku-notify"
  make || return 1
  make DESTDIR=$pkgdir/ install || return 1
}
