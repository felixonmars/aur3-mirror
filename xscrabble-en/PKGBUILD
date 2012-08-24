# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: pressh <pressh at gmail dot com>

pkgname=xscrabble-en
pkgver=1.0
pkgrel=2
pkgdesc="English language files for XScrabble"
arch=('any')
url="http://www.happypenguin.org/show?XScrabble"
license=('custom:unknown')
depends=('xscrabble')
source=(ftp://ftp.ac-grenoble.fr/ge/educational_games/xscrabble_en.tar.bz2)
md5sums=('2fb0ec2e84de2fb0b91ca2d6919df4d5')

build() {
  cd "$srcdir"/${pkgname/-/_}

  sed -i "s_/usr/share/games/scrabble_/usr/share/xscrabble_" app-defaults/XScrabble_en
}

package() {
  cd "$srcdir"/${pkgname/-/_}

  install -dm755 "$pkgdir"/usr/share/xscrabble/en
  install -m644 lib/* "$pkgdir"/usr/share/xscrabble/en/
  install -Dm644 app-defaults/XScrabble_en "$pkgdir"/usr/share/X11/app-defaults/XScrabble_en
}
