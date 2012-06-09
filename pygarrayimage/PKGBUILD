#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=pygarrayimage
pkgver=1.0
pkgrel=1
pkgdesc="Allow numpy arrays as source of texture data for pyglet."
arch=(any)
url="http://code.astraw.com/projects/motmot/pygarrayimage.html"
license=('BSD')
depends=('python2' 'python2-numpy' 'pyglet')
makedepends=('python2-distribute')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/p/pygarrayimage/${pkgname}-${pkgver}.tar.gz
        license)
md5sums=('15b18a4d3a5431b70bd92d52661491c7'
         'a69c2a83c46ca8cc87c4f597758b2743')

build() {
  cd "$srcdir"/${pkgname}-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/${pkgname}-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m755 "$srcdir"/license "$pkgdir"/usr/share/licenses/pygarrayimage/license
}

