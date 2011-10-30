# Maintainer: Elliott Hird <penguinofthegods@gmail.com>
pkgname=noidentd-git
pkgver=20111030
pkgrel=1
pkgdesc="A simple and robust fake identd"
arch=('i686' 'x86_64')
url="https://github.com/ehird/noidentd"
license=('MIT')
makedepends=('git')
provides=('noidentd')
backup=(etc/conf.d/noidentd)

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
  install -D -m755 noidentd.rc.d "$pkgdir/etc/rc.d/noidentd"
  install -D -m644 noidentd.conf.d "$pkgdir/etc/conf.d/noidentd"
}
