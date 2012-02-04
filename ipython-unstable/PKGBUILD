# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# based on community version of stable ipython package

pkgname=ipython-unstable
pkgver=0.11.rc4
pkgrel=1
_githubtag=a4e73d9
pkgdesc="An enhanced Interactive Python shell, unstable version."
url="http://ipython.scipy.org/"
provides=("ipython=$pkgver" "ipython-docs=$pkgver")
conflicts=('ipython' 'ipython-docs')
arch=('any')
depends=('python2>=2.6')
optdepends=("python-pexpect: for irunner"
            "python2-nose: if you want to run IPython's test suite"
            "python2-pyzmq: for parallel computing"
            "python2-pyqt: for qtconsole GUI"
            "pyside: alternative to PyQt for qtconsole GUI"
            "python2-pygments: for syntax highlighting in qtconsole"
)
license=('custom')
source=("https://github.com/ipython/ipython/tarball/rel-$pkgver")
md5sums=('c5881caecc873e569fd0d9a442336d0d')

build() {
  true
}

package() {
  cd "$srcdir/ipython-ipython-$_githubtag"

  install -Dm644 docs/source/about/license_and_copyright.txt "$pkgdir/usr/share/licenses/ipython/license.txt"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  rm -rf "$pkgdir/usr/share/doc"
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}

