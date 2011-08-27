# Maintainer: thotypous <matiasΘarchlinux-br·org>

pkgname="pyetk"
pkgver="0.1.2"
pkgrel="1"
pkgdesc="Toolkit based on the EFL (Python bindings)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('etk-cvs' 'python')
makedepends=('cvs' 'cython' 'pyrex')
source=("http://repository.maemo.org/extras/pool/gregale/free/source/p/python-etk/python-etk_${pkgver}-maemo1.tar.gz")
md5sums=('61055f69dfcff14b056e4dd406ab7d93')

build() {
  cd "$srcdir/python-etk"

  _incdir=`python -c "import distutils.sysconfig; \
      print distutils.sysconfig.get_python_inc()"`
  python setup.py install --root="$pkgdir" \
      install_headers --install-dir="$pkgdir/${_incdir}" || return 1

  install -Dm644 "$srcdir/python-etk/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "$srcdir/python-etk/COPYING-PLAIN" "$pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN"
}
