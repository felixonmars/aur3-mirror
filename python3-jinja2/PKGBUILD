# Contributor: Paul Colomiets <pc@gafol.net>

pkgname=python3-jinja2
pkgver=2.5.5
pkgrel=1
pkgdesc="A simple pythonic template language written in Python"
license=("BSD")
url="http://jinja.pocoo.org/"
depends=('python-distribute')
source=(http://pypi.python.org/packages/source/J/Jinja2/Jinja2-$pkgver.tar.gz)
arch=('any')
md5sums=('83b20c1eeb31f49d8e6392efae91b7d5')

build() {
  cd $srcdir/Jinja2-$pkgver
  python setup.py install --root=$pkgdir --optimize=0
}
