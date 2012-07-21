# Contributor: John K. Luebs <jkluebs@luebsphoto.com>

pkgname=python2-premailer
pkgver=1.11
pkgrel=1
pkgdesc="Turns CSS blocks into style attributes"
arch=('any')
url='http://pypi.python.org/pypi/premailer/'
license=('PSF')
depends=('python2')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/p/premailer/premailer-$pkgver.tar.gz")
md5sums=('706182882c4b9f8e948e6af50c8a128b')

build () {
    cd ${srcdir}/premailer-$pkgver
    python2 setup.py build
}

package () {
    cd ${srcdir}/premailer-$pkgver
    python2 setup.py install --root=${pkgdir} --optimize=1
}
