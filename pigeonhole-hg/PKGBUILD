# Contributor: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=pigeonhole-hg
pkgver=1381
pkgrel=2
pkgdesc="Fully rewritten Sieve implementation for Dovecot v2.0"
arch=('i686' 'x86_64')
url="http://pigeonhole.dovecot.org/"
license=('LGPL')
depends=('dovecot>=2.0.0')
makedepends=('mercurial')
conflicts=('dovecot-sieve')

_hgroot="http://hg.rename-it.nl/"
_hgrepo="dovecot-2.0-pigeonhole"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot$_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."


  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  ./autogen.sh
  ./configure --prefix=/usr --with-dovecot=/usr/lib/dovecot
  make
  make DESTDIR="$pkgdir/" install
} 
