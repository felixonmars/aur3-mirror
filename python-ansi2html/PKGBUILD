# Packager: Samir Faci <csgeek at archlinux dot us> 
_name=ansi2html
pkgname=python-${_name}
pkgver=0.6.0
pkgrel=1
pkgdesc="Documentation tool"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/ansi2html/0.5.2"
license=('GPL')
depends=('python2' )
makedepends=()
builddepends=( 'python2-distribute' )
source=("http://pypi.python.org/packages/source/a/ansi2html/ansi2html-${pkgver}.tar.gz#md5=969cb11d467fa0eeee9dce3d3468b1bb")
md5sums=('969cb11d467fa0eeee9dce3d3468b1bb')

build() 
{
  cd ${srcdir}/${_name}-${pkgver}

  python2 setup.py install --root=${pkgdir}  --optimize=1 || return 1
}

# vim:set ts=2 sw=2 et:

