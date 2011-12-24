# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=xxxterm-git
pkgver=20111224
pkgrel=1
pkgdesc="A minimalists web browser, vi-like while maintaining traditional web browser behavior."
arch=('i686' 'x86_64')
url="http://opensource.conformal.com/wiki/XXXTerm"
license=('custom:ISC')
depends=('libwebkit' 'gtk2' 'libbsd')
conflicts=('xxxterm')
provides=('xxxterm')
makedepends=('git')
optdepends=()
source=()
md5sums=()

_gitroot="git://opensource.conformal.com/xxxterm.git"
_gitname="xxxterm"

build() {
  cd "$srcdir"
  msg "Connecting to conformal.com..."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  
  cd "$srcdir/$_gitname"
  sed -i 's|LIBS= gtk+-2.0|& javascriptcoregtk-1.0|' linux/Makefile
  sed -i 's|/etc/ssl/cert.pem|/etc/ssl/certs/ca-certificates.crt|' xxxterm.conf
  # no spam
  sed -i 's|https://www.cyphertite.com|http://archlinux.org|' xxxterm.{c,conf}
  cd linux
  sed -i 's/gnutls/& libbsd/' Makefile
  make javascript.h
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$_gitname/linux"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  cd ..
  install -Dm644 xxxterm.conf "$pkgdir/etc/xxxterm.conf"
  cd ../..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
