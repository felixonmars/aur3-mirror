# Maintainer: Army
_pkgname=cursetag
pkgname=$_pkgname-git
pkgver=20120729.29
pkgrel=1
pkgdesc="NCurses based audio file tag (metadata) editor"
arch=('i686' 'x86_64')
url="https://github.com/lotuskip/cursetag"
license=('custom:none')
depends=('taglib')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://github.com/lotuskip/cursetag.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  sed -e ':a' -e '$q;N;4,$D;ba' README > LICENSE
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
