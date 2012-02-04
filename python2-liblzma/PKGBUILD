# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-liblzma
pkgver=0.5.3
pkgrel=0
pkgdesc="This is a Python interface to the LZMA library."
arch=('i686' 'x86_64')
url="https://launchpad.net/pyliblzma"
license=('LGPL 3')
depends=('python2' 'xz')
source=("http://pypi.python.org/packages/source/p/pyliblzma/pyliblzma-${pkgver}.tar.bz2")
md5sums=("500f61116ee1ab4063b49c121786863a")
build() {
  cd "$srcdir/pyliblzma-${pkgver}"
  python2 setup.py build install --root="${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:
