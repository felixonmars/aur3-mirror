# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=xgetidle-git
pkgver=20121207
pkgrel=1
pkgdesc="Get X11 idle time."
arch=('i686' 'x86_64')
url='http://git.suckless.org/xgetidle/'
license=('custom:MIT')
makedepends=('git')
depends=('libxss')

_gitroot='git://git.suckless.org/xgetidle'
_gitname='master'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
