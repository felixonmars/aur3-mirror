# Contributor: Leontius Adhika Pradhana <leon@leapon.net>

pkgname=rdfextras
pkgver=10
pkgrel=1
pkgdesc="A collection of extra utilities based on RDFLib"
url="http://code.google.com/p/rdfextras/"
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('python2' 'rdflib')
makedepends=('mercurial')
source=()
md5sums=()

_hgroot="https://rdfextras.googlecode.com/hg/"
_hgrepo="rdfextras"

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
  msg "Running setup.py..."
  
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}

