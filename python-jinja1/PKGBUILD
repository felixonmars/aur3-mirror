# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=python-jinja1
pkgver=1.2
pkgrel=2
pkgdesc="A simple pythonic template language written in Python"
license=("BSD")
url="http://jinja.pocoo.org/1/"
depends=('python2')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/J/Jinja/Jinja-$pkgver.tar.gz)
arch=('i686' 'x86_64')
md5sums=('1235a005ade00b213800ff1e798c0241')

build() {
  cd ${srcdir}/Jinja-$pkgver
  python2 setup.py install --root="${pkgdir}"
}
