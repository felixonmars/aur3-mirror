# Contributor: Luis Henrique <lmello.009@gmail.com>
pkgname=mktoc
pkgver=1.3
pkgrel=1
pkgdesc="Converts cue files to the toc format"
arch=(any)
license=('GPL')
depends=(python2-chardet)
makedepends=(python2-distribute)
source=(http://mktoc.googlecode.com/files/mktoc-$pkgver.tar.gz)
url="http://pythonhosted.org/mktoc/"
md5sums=('2eabcdc8c9433d1a398e113b8a8299b4')

build() {
    cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}

