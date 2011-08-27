# Maintainer: Yuri Bochkarev <baltzar.bz gmail com>
# Contributor: Yuri Bochkarev <baltzar.bz gmail com>
pkgname=rebar-hg
_pkgname=rebar
pkgver=335
pkgrel=1
pkgdesc="Erlang Build Tools"
arch=('i686' 'x86_64')
url="http://hg.basho.com/rebar"
license=('APACHE')
depends=('erlang')
makedepends=('mercurial')
provides=('rebar')
conflicts=('rebar')

_hgroot="http://hg.basho.com"
_hgrepo="rebar"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  make || return 1
  install -D "$_pkgname" "$pkgdir/usr/bin/$_pkgname" || return 1
}
