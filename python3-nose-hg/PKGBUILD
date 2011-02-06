# Maintainer: Paul Viren <paul dot viren at lmco.com>
pkgname=python3-nose-hg
pkgver=718
pkgrel=1
pkgdesc="A unittest-based testing framework for python"
arch=('any')
url="http://code.google.com/p/python-nose/"
license=('LGPL3')
depends=('python')
makedepends=('mercurial')

_hgroot="https://python-nose.googlecode.com/hg/"
_hgbranch="py3k"
_hgrepo="python-nose"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    hg update $_hgbranch || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
    hg update $_hgbranch || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
  sed -i -e "s:man/man1:share/man/man1:g" setup.py
  python setup.py install --prefix=/usr --root=${pkgdir} || return 1
} 
