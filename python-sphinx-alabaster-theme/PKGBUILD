
pkgbase=python-sphinx-alabaster-theme
pkgname=('python-sphinx-alabaster-theme' 'python2-sphinx-alabaster-theme')
pkgver=0.7.3
pkgrel=1
arch=('any')
pkgdesc="Modified Kr Sphinx doc theme"
url='https://github.com/bitprophet/alabaster'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/bitprophet/alabaster/archive/${pkgver}.tar.gz")
md5sums=('f4bbebd4b12417f15e96aa6a5446c917')

build() {
  cp -r ${srcdir}/alabaster-${pkgver} ${srcdir}/alabaster-${pkgver}-py2
  
  cd "$srcdir"/alabaster-${pkgver}
  python setup.py build

  cd "$srcdir"/alabaster-${pkgver}-py2
  python2 setup.py build
}

package_python-sphinx-alabaster-theme() {
  cd "$srcdir"/alabaster-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-sphinx-alabaster-theme() {
  cd "$srcdir"/alabaster-${pkgver}-py2 
  python2 setup.py install --root="$pkgdir" --optimize=1
}

