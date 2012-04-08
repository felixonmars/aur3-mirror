# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Exaos Lee <Exaos.Lee@gmail.com>
pkgname=python2-lupa
pkgver=0.20
pkgrel=1
pkgdesc="Intergrate the LuaJIT2 runtime into CPython"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/lupa"
license=('MIT')
depends=('luajit>=2.0.0b9' 'python2')
provides=('python2-lupa')
conflicts=('python2-lupa-git')
replaces=('python2-lupa-git')
source=(http://pypi.python.org/packages/source/l/lupa/lupa-$pkgver.tar.gz)
md5sums=('a1bd4f3eef4cbcca56c3c22343acf143')

build() {
  cd $startdir/src/lupa-$pkgver
  python2 setup.py build
}

package() {
  cd $startdir/src/lupa-$pkgver

  python2 setup.py install --root=$startdir/pkg
}

# vim:set ts=2 sw=2 et:
