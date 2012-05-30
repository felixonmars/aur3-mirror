# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=python2-putio
pkgver=7
pkgrel=2
pkgdesc="Python implementation of the official Put.io API"
arch=(any)
url="http://code.google.com/p/putio-api/"
license=('APACHE')
depends=('python-simplejson')
install=
source=(http://putio-api.googlecode.com/svn/trunk/putio.py)
md5sums=('a70b9b4933f7e44c9a29e0d82b2d624a')
sha1sums=('51a2c47a3633afee4c69258a5e086a35d9ddb527')

build() {
  # Fix python2
  sed -i -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' "$srcdir/putio.py"
}

package() {
  cd "$srcdir"

  _ver=$(python2 --version 2>&1 | cut -c 8-10)
  install -Dm644 putio.py "$pkgdir/usr/lib/python$_ver/site-packages/putio.py"
}

# vim:set ts=2 sw=2 et:
