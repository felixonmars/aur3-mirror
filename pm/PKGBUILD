# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=pm
pkgver=1.0
pkgrel=1
pkgdesc="pacman-related tasks shortcuts script"
arch=('any')
url="http://linuxtidbits.wordpress.com/2012/06/18/wrapper-script-for-common-pacman-related-tasks/"
license=('GPL')
depends=(pacaur)
conflicts=(festival)
source=(pm)
noextract=(pm)
md5sums=('ca85a888fbdbc3ca4ebf49ed9d30b5be')

package() {
  cd "$srcdir/"
  install -d "$pkgdir/usr/bin"
  install -Dm0555 "$startdir/pm" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
