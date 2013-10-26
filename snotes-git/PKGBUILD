# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Army
_pkgname=snotes
pkgname=$_pkgname-git
pkgver=20130819.45
pkgrel=2
pkgdesc="a simple system for organizing your notes"
arch=('any')
url="https://github.com/v4hn/snotes"
license=('MIT')
depends=('dmenu' 'git')
optdepends=('perl: to clean notes automatically with the SNOTES_CLEANUP option'
'xterm: for the default config - change it in ~/.snotes/config')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/v4hn/snotes.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
