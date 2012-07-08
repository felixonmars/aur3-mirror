# Maintainer: Etienne Perot <etienne@perot.me>
pkgname=pigeonhole-extprograms-hg
pkgver=35
pkgrel=1
pkgdesc="Plugin for the Dovecot 2 Pigeonhole Sieve extension, which allows running custom (whitelisted) programs within Sieve scripts."
arch=('i686' 'x86_64')
url='http://wiki2.dovecot.org/Pigeonhole/Sieve/Plugins/Extprograms'
license=('LGPL2.1')
depends=('dovecot' 'pigeonhole')
makedepends=('mercurial')

_hgroot='http://hg.rename-it.nl/'
_hgrepo='pigeonhole-0.3-sieve-extprograms'

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  ./autogen.sh
  ./configure --prefix=/usr --with-dovecot=/usr/lib/dovecot --with-pigeonhole=/usr/include/dovecot/sieve --with-moduledir=/usr/lib/dovecot/modules
  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR="$pkgdir/" install
}
