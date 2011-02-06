# -*- shell-script -*-
#
# Arch Linux package build script
#
# $Id: PKGBUILD,v e6b853106df9 2010/10/27 05:34:52 vsevolod $

python=python2
name=decoroute

pkgname=$python-$name-hg
pkgver=57
pkgrel=1
pkgdesc="Pattern-matching based WSGI-compliant URL routing tool"
arch=(any)
url="http://pypi.python.org/pypi/$name"
license=('LGPL2')
depends=("$python")
makedepends=('mercurial')

_hgroot="http://bitbucket.org/sevkin"
_hgrepo=$name

build() {
  cd $srcdir/$name
  $python setup.py install --prefix=/usr --root=$pkgdir
}
