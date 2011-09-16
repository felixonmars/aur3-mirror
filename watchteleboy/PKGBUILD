# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ramón Cahenzli <rca@psy-q.ch> 
pkgname=watchteleboy
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="Script to watch streams from teleboy.ch without browser/flash"
arch=('any')
url="https://github.com/reduzent/watchteleboy"
license=('GPL')
groups=()
depends=('mplayer' 'rtmpdump' 'wget' 'recode')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('a86656beda18a325f767f37035b42e21')

package() {
  install -D -m 755 watchteleboy $pkgdir/usr/bin/watchteleboy
  install -d -m 755 $pkgdir/usr/share/man/man1/
  install -D -m 644 DOCS/man/watchteleboy.1 $pkgdir/usr/share/man/man1/
  install -d -m 755 $pkgdir/usr/share/doc/watchteleboy
  install -D -m 644 README $pkgdir/usr/share/doc/watchteleboy/
  install -D -m 644 LICENSE $pkgdir/usr/share/doc/watchteleboy/
}

# vim:set ts=2 sw=2 et:
