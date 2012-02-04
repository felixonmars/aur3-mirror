# Maintainer: Bruno Carlin <self at aerdhyl dot eu>
pkgname=python2-setuptools_git
pkgver=0.4.2
pkgrel=2
pkgdesc="Setuptools revision control system plugin for Git"
arch=(any)
url="http://pypi.python.org/pypi/setuptools-git"
license=('Public Domain')
depends=('python2' 'python2-distribute' 'git')
makedepends=('tar' 'gzip')
source=("http://pypi.python.org/packages/source/s/setuptools-git/setuptools-git-$pkgver.tar.gz")
md5sums=('6e2de2238d768f0197f8c041c1f0f5b5')
options=(!emptydirs)

build() {
  cd $srcdir/setuptools-git-$pkgver
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' setuptools_git.py
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

