#Maintainer max_meyer
pkgname=shflags-svn
pkgver=141
pkgrel=1
pkgdesc="Shell Flags (shFlags) is a library written to greatly simplify the handling of command-line flags"
arch=(any)
url="http://code.google.com/p/shflags/"
license=('LGPL')
depends=(sh)
provides=(shflags)
optdepends=(bash zsh dash ksh)
options=(zipman)
_svntrunk='http://shflags.googlecode.com/svn/trunk'
_svnmod='shflags-read-only'

build() {
  cd "$srcdir"
  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
  else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
 
  src="$srcdir/$_svnmod/source/1.0/lib"
  dst="$pkgdir/usr/share/lib/shflags"
  mkdir -p "$dst" 

  if [ -f "$src/shflags" ]; then
      cp "$src/shflags" "$dst/shflags.sh"
  else
      msg "Warning shflags not found"
      exit 1
  fi

}

# vim:set ts=2 sw=2 et:
