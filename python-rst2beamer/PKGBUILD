# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@farnsworth>
pkgname=python-rst2beamer
pkgver=0.6.6
pkgrel=4
pkgdesc="A docutils writer and script for converting restructured text to the Beamer presentation format"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/rst2beamer"
license=('GPL')
depends=('docutils' 'texlive-bin' 'python2-pygments')
source=(http://pypi.python.org/packages/source/r/rst2beamer/rst2beamer-$pkgver.tar.gz)
md5sums=('9bd2b7f6b659b5ffe8bc1e1ea8c12c77')

build() {
  cd $startdir/src/rst2beamer-$pkgver
  python2 setup.py install --root=$startdir/pkg --prefix=/usr || return 1
}
