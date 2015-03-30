#Maintainer: Andreas Theodosiou <andreasabu at gmail dot com>
#Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>

pkgname=python-pymox
_orig_name=mox
pkgver=0.5.3
pkgrel=2
pkgdesc="A mock object framework for Python."
arch=('any')
license=('Apache')
depends=('python2')
url="http://code.google.com/p/pymox/"
provides=('pymox' 'mox')
source=("http://pymox.googlecode.com/files/$_orig_name-$pkgver.tar.gz")
md5sums=('2c43da56ed1bbbbf7805e81c76a924cc')

package() {
  cd "${srcdir}/$_orig_name-$pkgver"
  python2 ./setup.py install --root=$pkgdir/ --optimize=1
}

