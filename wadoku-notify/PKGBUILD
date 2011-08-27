# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: BoscoWitch <boscowitch@boscowitch.de>
# Contributor: BoscoWitch <boscowitch@boscowitch.de>
pkgname=wadoku-notify
pkgver=0.2
pkgrel=1
pkgdesc="A wadoku popup translator for selected text."
arch=('i686' 'x86_64')
url="http://wadoku.de/forum/posts/list/1141.page"
license=('GPL')
depends=('gtk' 'sqlite3')
makedepends=('make' 'gcc' 'vala' 'gtk' 'sqlite3' 'sed')
source=(http://www.boscowitch.de/jap/wadoku_notify-$pkgver.tar.xz)
md5sums=('fc00bc5d215e54e67555138c9fa782a0')

build() {
  cd "$srcdir/WadokuNotify"
  make wadoku-notify || return 1
  make prefix=$pkgdir/usr install || return 1
}
