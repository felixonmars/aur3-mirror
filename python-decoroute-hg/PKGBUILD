# -*- shell-script -*-
# Arch Linux package build script
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
#
# $Id: PKGBUILD,v cf7e9031de06 2010/04/19 10:04:35 vsevolod $

name=decoroute
pkgname=python-$name-hg
pkgver=49
pkgrel=1
pkgdesc="Pattern-matching based WSGI-compliant URL routing tool"
arch=(any)
url="http://pypi.python.org/pypi/$name"
license=('LGPL2')
depends=('python')
makedepends=('setuptools' 'mercurial')

_hgroot="http://bitbucket.org/sevkin"
_hgrepo=$name

build() {
  cd "$srcdir/$name"
  python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
}
