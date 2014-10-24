# Maintainer: Robert Orzanna <orschiro@gmail.com>

pkgname=dmenu-recent-aliases
pkgver=r26.77f5307
pkgrel=1
pkgdesc="Launch dmenu with custom aliases support stored in ~/.zsh_aliases, sorted by recent use"
arch=('any')
url="https://github.com/orschiro/dmenu-scripts-collection/tree/master/dmenu-recent-aliases"
license=('GPL2')
depends=('dmenu' 'rxvt-unicode')
source=("$pkgname"::'git://github.com/orschiro/dmenu-scripts-collection.git')
install=dmenu-recent-aliases.install
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/$pkgname/dmenu_recent_aliases" "$pkgdir/usr/bin/dmenu_recent_aliases"
}