# -*- shell-script -*-
# Arch Linux package build script
#
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>
#
# $Id: PKGBUILD,v 2713dfc8b831 2011/04/12 19:48:58 vsevolod $

python=python2
name='revers.py'

pkgname=$name-hg
pkgver=26
pkgrel=1
pkgdesc="Reverse Entity-Relationship Storm"
arch=(any)
url="http://pypi.python.org/pypi/$name"
license=('GPL')
depends=("$python-storm")
makedepends=('mercurial')

_hgroot="http://bitbucket.org/sevkin"
_hgrepo=$name

build() {
  cd $srcdir/$name
  $python setup.py install --prefix=/usr --root=$pkgdir
}
