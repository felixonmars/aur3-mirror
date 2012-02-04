# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@farnsworth>
pkgname=python-itertools-recipes
pkgver=0.1
pkgrel=1
pkgdesc="Pasted from the 'Recipes' section of the 'itertools' documentations: An extended toolset using the existing itertools as building blocks."
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/itertools_recipes"
license=('PSF')
depends=('python')
source=(http://pypi.python.org/packages/source/i/itertools_recipes/itertools_recipes-$pkgver.tar.gz)
md5sums=('2ec2066053d5716e45280354acfdc0db')

build() {
  cd $startdir/src/itertools_recipes-$pkgver
  python setup.py install --root=$startdir/pkg --prefix=/usr || return 1
}
