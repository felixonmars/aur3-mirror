# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-appinst
pkgver=2.1.2
_githubtag=fc3ac1f
pkgrel=1
pkgdesc="Cross platform APIs used to install applications"
arch=('any')
url="https://github.com/enthought/appinst"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=('python2-appinst-git' 'python-ets-appinst-svn')
options=(!emptydirs)

source=("https://github.com/enthought/appinst/tarball/${pkgver}"
        "LICENSE.txt")
md5sums=('82723f502eeea68de8d0401b41c129df'
         'ae6f5df0e6d4dd4ea3cc20aafb2dd10f')

build() {
  cd "$srcdir"/enthought-appinst-${_githubtag}

  python2 setup.py build
}

package() {
  cd "$srcdir"/enthought-appinst-${_githubtag}

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/python2-appinst/LICENSE"
}

