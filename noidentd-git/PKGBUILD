# Maintainer: Elliott Hird <penguinofthegods@gmail.com>
pkgname=noidentd-git
pkgver=20111028
pkgrel=1
pkgdesc="A simple and robust fake identd"
arch=('any')
url="https://github.com/ehird/noidentd"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('noidentd')

_gitroot="https://github.com/ehird/noidentd.git"
_gitname="noidentd"

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
  make PREFIX="$pkgdir/usr" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 noidentd.rcd "$pkgdir/etc/rc.d/noidentd"
  install -D -m644 noidentd.confd "$pkgdir/etc/conf.d/noidentd"
}
