# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
pkgname=lua-flu-hg
pkgver=45
pkgrel=2
pkgdesc="Filesystems in Lua Userspace"
arch="any"
url="http://piratery.net/flu/"
license=('MIT')
depends=('lua>=5.1')
makedepends=('mercurial' 'fuse')

_hgroot="http://hg.piratery.net"
_hgrepo="flu"

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

  #
  # BUILD HERE
  #

	make install PREFIX=$pkgdir/usr
	install -Dm0664 doc/LICENSE.txt \
	 $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
