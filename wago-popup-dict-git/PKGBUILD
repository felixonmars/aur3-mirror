# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: BoscoWitch <boscowitch@boscowitch.de>
# Contributor: BoscoWitch <boscowitch@boscowitch.de>
pkgname=wago-popup-dict-git
pkgver=0.1
pkgrel=1
pkgdesc="A japanese popup translator for selected text (japanese 
-> english edict and japanese -> german wadoku dict included) ."
arch=('i686' 'x86_64')
url="http://develop.boscowitch.de/boscowitch/wago-popup-dict"
license=('GPL')
depends=('gtk')
makedepends=('git' 'vala' 'gtk' 'gcc' 'autoconf' 'make' 
'automake')
_gitroot='http://develop.boscowitch.de/boscowitch/wago-popup-dict.git'
source=()
md5sums=()

build() {
  git clone $_gitroot
  cd "$srcdir/wago-popup-dict"
  ./autogen.sh
  make || return 1
  make DESTDIR="$pkgdir/"  install || return 1
}
