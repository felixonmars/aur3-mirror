# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: BoscoWitch <boscowitch@boscowitch.de>
# Contributor: BoscoWitch <boscowitch@boscowitch.de>
pkgname=dict-notify-git
pkgver=0.1
pkgrel=1
pkgdesc="A dictd popup client for selected text."
arch=('i686' 'x86_64')
url="http://www.boscowitch.de"
license=('GPL')
depends=('gtk' 'dictd')
makedepends=('make' 'gcc' 'git' 'vala' 'gtk')
_gitroot='git://github.com/boscowitch/dict-notify.git'
source=()
md5sums=()

build() {
  git clone $_gitroot
  cd "$srcdir/dict-notify"
  make
  make install || return 1
}
