# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=cuevanalinks
pkgver=0.5
pkgrel=1
pkgdesc="A program to download movies or series from cuevana.tv"
arch=('any')
url="https://bitbucket.org/tin_nqn/cuevanalinks"
license='GPL3'
depends=('cuevanalib' 'plac' 'python2-progressbar')
source=(http://pypi.python.org/packages/source/C/CuevanaLinks/CuevanaLinks-$pkgver.tar.gz)
md5sums=('cae8bab24603a403dd159c55bf27bd36')
conflicts=('cuevanalinks-gui-hg' 'cuevanalinks-hg')

build() {
   cd $srcdir/CuevanaLinks-$pkgver

   python2 setup.py install --root $pkgdir --optimize=1
}