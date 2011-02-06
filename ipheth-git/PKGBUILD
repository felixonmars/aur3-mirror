# Contributor: Erez Zarum <erez@erezzarum.com>

pkgname=ipheth-git
pkgver=20100223
pkgrel=1
pkgdesc="Support for iPhone tethering through USB cables."
arch=('i686' 'x86_64')
url="http://giagio.com/wiki/moin.cgi/iPhoneEthernetDriver"
license=(GPL)
depends=('libiphone-git')
makedepends=('git' 'gcc' 'glib2' 'make' 'kernel26-headers' 'kernel26')
provides=("ipheth=$pkgver")
conflicts=(ipheth)
install=ipheth-git.install

_gitroot="git://github.com/dgiagio/ipheth.git"
_gitname="ipheth"

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

  cd "$srcdir/$_gitname-build/ipheth-pair"
  make || return 1
  install -D -m755 ipheth-pair $pkgdir/lib/udev/ipheth-pair || return 1
  install -D -m644 90-iphone-tether.rules $pkgdir/etc/udev/rules.d/90-iphone-tether.rules || return 1

  cd "$srcdir/$_gitname-build/ipheth-driver"
  make || return 1
  install -D -m 755 ipheth.ko $pkgdir/lib/modules/$(uname -r)/extra/ipheth.ko || return 1
} 
