# Contributor: Stefan Mark <mark at unserver dot de>
pkgname=fmenu-git
pkgver=20100925
pkgrel=1
pkgdesc="a dmenu fork, seems kinda dead"
arch=('i686' 'x86_64')
url="http://github.com/scy/fmenu.git"
license=('MIT')
depends=('libx11')
makedepends=('git')
provides=()
conflicts=()

_gitroot="git://github.com/scy/fmenu.git"
_gitname="dwm-sprinkles"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 || return 1
  make PREFIX=/usr DESTDIR=$pkgdir install || return 1

  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE && \
  install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
}

