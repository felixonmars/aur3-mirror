# Contributor: Grigorios Bouzakis <grbzks@gmail.com> 
pkgname=mktorrent-borg
pkgver=0.9.9
pkgrel=1
pkgdesc="A handy tool for creating .torrent files for UNIX"
arch=('i686' 'x86_64')
url="http://borg.uu3.net/~borg/?mktorrent"
license=('BSD')
depends=('openssl')
source=(ftp://borg.uu3.net/pub/unix/mktorrent/mktorrent-${pkgver}.tgz)

build() {
  cd "$srcdir/mktorrent"

  make || return 1

  install -D -m755 mktorrent $pkgdir/usr/bin/mktorrent-borg
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/mktorrent/LICENSE
}

# vim:set ts=2 sw=2 et:
md5sums=('8bdfa36982446f3ccd8549fedefb7448')
sha1sums=('6e4334097ae1e1ae9a6d019c13640bd6355e2605')
