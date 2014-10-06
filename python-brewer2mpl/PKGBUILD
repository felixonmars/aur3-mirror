# Maintainer:  Kyle Meyer <kyle@kyleam.com>

pkgname=python-brewer2mpl
# To build and install the python 2 package as well, use the next line
# instead of the above one.
# pkgname=('python-brewer2mpl' 'python2-brewer2mpl')

_libname=${pkgname/python-/}
pkgver=1.4.1
pkgrel=1
pkgdesc='Connect colorbrewer2.org color maps to Python and matplotlib'
arch=('any')
url='https://github.com/jiffyclub/brewer2mpl/wiki'
license=('MIT')
source=("https://pypi.python.org/packages/source/b/brewer2mpl/brewer2mpl-$pkgver.tar.gz")
md5sums=('f8cd1fbb9f5d836a3a095b1ca9d58fc2')

build() {
  cd "$srcdir/$_libname-$pkgver"

  rm -rf ../buildpy3; mkdir ../buildpy3
  python setup.py build -b ../buildpy3

  ## python 2 build
  if [ ${#pkgname[@]} -eq 2 ]; then
    rm -rf ../buildpy2; mkdir ../buildpy2
    python2 setup.py build -b ../buildpy2
  fi
}

package_python-brewer2mpl() {
  depends=('python' 'python-matplotlib')
  cd "$srcdir/$_libname-$pkgver"
  rm -rf build; ln -s ../buildpy3 build
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

package_python2-brewer2mpl() {
  depends=('python2' 'python2-matplotlib')
  cd "$srcdir/$_libname-$pkgver"
  rm -rf build; ln -s ../buildpy2 build
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
