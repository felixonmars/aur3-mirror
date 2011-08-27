# -*- shell-script -*-
# Arch Linux package build script
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
#
# $Id: PKGBUILD,v 7c6a50e6f806 2011/04/12 19:42:33 vsevolod $

python=python2
name=middlestorm

pkgname=$python-$name-hg
pkgver=55
pkgrel=1
pkgdesc="Middleware for use Storm ORM in WSGI applications"
arch=(any)
url="http://pypi.python.org/pypi/$name"
license=('LGPL2')
depends=("$python-storm")
makedepends=('mercurial')

_hgroot="http://bitbucket.org/sevkin"
_hgrepo=$name

build() {
  cd "$srcdir/$name"
  $python setup.py install --prefix=/usr --root=$pkgdir
}
