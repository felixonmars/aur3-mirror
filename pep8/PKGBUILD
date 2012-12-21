# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Ismael Carnales <icarnales at gmail dot com>
# Maintainer: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=pep8
pkgver=1.3.4
pkgrel=1
pkgdesc="Python style guide checker"
arch=('any')
url="http://github.com/jcrocholl/pep8/"
license=('Expat')
depends=('python2' 'setuptools')
source=(http://pypi.python.org/packages/source/p/pep8/$pkgname-$pkgver.tar.gz)
sha256sums=('9c4a53f03df131cf101eb2cd8108160314c8ac1af5c9a4147ab18c1d170f39c5')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root=$pkgdir/ || return 1
}

# vim:set ts=2 sw=2 et:
