# Maintainer: Army
_pkgname=dwmstatus
pkgname=$_pkgname-git
pkgver=20121224.3
pkgrel=1
pkgdesc="sets dwm's status bar text"
arch=('i686' 'x86_64')
url="http://dwm.suckless.org/dwmstatus"
license=('MIT')
depends=('libx11')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://git.suckless.org/dwmstatus")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX="/usr" DESTDIR="$pkgdir/"
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
