# Contributor: Emanuele Cipolla <mail@emanuelecipolla.net>

pkgname=python-jinja2
pkgver=2.5
pkgrel=2
pkgdesc="A simple pythonic template language written in Python"
license=("BSD")
url="http://jinja.pocoo.org/"
depends=('python2')
source=(http://pypi.python.org/packages/source/J/Jinja2/Jinja2-$pkgver.tar.gz)
arch=('i686' 'x86_64')
md5sums=('d02f82e33afe918cef8a9abcd23ccd78')

build() {
  cd $startdir/src/Jinja2-$pkgver
  python setup.py install --root=$startdir/pkg --optimize=1 || return 1
}
