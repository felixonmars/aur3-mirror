# Maintainer: Tasos Latsas <tlatsas2000 at gmail dot com>

pkgname=pyclamd-svn
pkgver=13
pkgrel=1
pkgdesc="A python interface to Clamd (Clamav daemon)"
arch=('any')
url="http://code.google.com/p/pyclamd/"
license=('LGPL3')
depends=('clamav' 'python2')
makedepends=('subversion')
source=('example-fix.patch')
md5sums=('108a46e2394e474bde25de3468ea5d84')

_svntrunk="http://pyclamd.googlecode.com/svn/trunk/"
_svnmod="pyclamd"

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

  cd "$srcdir/$_svnmod-build"

  patch -Np1 -i ${srcdir}/example-fix.patch

  sed -i 's,#!/usr/bin/env python,&2,' "${srcdir}/${_svnmod-build}/__init__.py"
  sed -i 's,#!/usr/bin/env python,&2,' "${srcdir}/${_svnmod-build}/example.py"
  sed -i 's,#!/usr/bin/env python,&2,' "${srcdir}/${_svnmod-build}/pyclamd.py"

  python2 setup.py build
}

package() {
  cd "$srcdir/$_svnmod-build"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
}
