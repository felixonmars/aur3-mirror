# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-boto
pkgver=2.1.1
pkgrel=2
pkgdesc="This is the Python interface to the Amazon Web Services."
arch=('i686' 'x86_64')
url="http://code.google.com/p/boto/"
license=('MIT')
depends=('python2')
source=("http://boto.googlecode.com/files/boto-${pkgver}.tar.gz")
md5sums=('5528f3010c42dd0ed7b188a6917295f1')

build() {
  cd "$srcdir/boto-${pkgver}"
  python2 setup.py build install --root="${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:
