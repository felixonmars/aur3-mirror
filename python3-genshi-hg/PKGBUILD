# Maintainer: BeholdMyGlory <larvid@gmail.com>

pkgname=python3-genshi-hg
pkgver=893
pkgrel=1
pkgdesc="Python toolkit for stream-based generation of output for the web."
url="http://genshi.edgewall.org/"
license=("BSD")
arch=('any')
depends=('python')
makedepends=('python-distribute' 'mercurial')

_hgroot="https://bitbucket.org/hodgestar"
_hgrepo="genshi-py3k"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    echo hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  python setup.py install --root=$pkgdir
  install -D -m0644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
