# Maintainer: Tom Vincent <http://tlvince.com/contact/>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: v2punkt0 <v2punkt0@gmail.com>

_pkgname=dmenu
pkgname=$_pkgname-config-git
pkgver=20130306
pkgrel=1
pkgdesc="A generic menu for X, latest hg pull, sourced config patch"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama')
makedepends=('git')
conflicts=('dmenu')
provides=('dmenu')
source=('config.patch')
md5sums=('34f84ecc65b7892b296b5fd18400d355')

_gitroot="git://git.suckless.org/$_pkgname"
_gitname="$_pkgname"

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

  patch < "$srcdir/config.patch"

  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
