# -*- shell-script -*-
# Arch Linux package build script
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
#
# $Id: PKGBUILD,v 6e93d8206fa1 2010/04/19 10:01:25 vsevolod $

name=middlestorm
pkgname=python-$name-hg
pkgver=49
pkgrel=1
pkgdesc="Middleware for use Storm ORM in WSGI applications"
arch=(any)
url="http://pypi.python.org/pypi/$name"
license=('LGPL2')
depends=('python' 'storm')
makedepends=('setuptools' 'mercurial')

_hgroot="http://bitbucket.org/sevkin"
_hgrepo=$name

build() {
  cd "$srcdir/$name"
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
