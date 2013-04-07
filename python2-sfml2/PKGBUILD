# Maintainer: Jorge Araya Navarro <jorgean@lavabit.com>
pkgname=python2-sfml2
pkgver=1.2
pkgrel=0
pkgdesc="Python 2 binding for SFML 2, written with Cython."
arch=('i686' 'x86_64')
url="http://openhelbreath.net/python-sfml2"
license=('LGPL3')
depends=('sfml' 'python2')
makedepends=('sfml' 'cython2')
conflicts=('python2-pysfml2' 'python2-pysfml2-git' 'python2-sfml2')
source=('https://github.com/Sonkun/python-sfml/archive/v1.2.zip')
optdepends=('pyqt-common: To use pysfml with Qt')

build() {
    cd "$srcdir/python-sfml-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/python-sfml-$pkgver"
    python2 setup.py install --root="${pkgdir}" --prefix=/usr

    # Copying the examples
    install -d -m755 "${pkgdir}/usr/lib/python2.7/site-packages/sfml/examples"

    cp -R examples/spacial_music "${pkgdir}/usr/lib/python2.7/site-packages/sfml/examples/"
    cp -R examples/pyqt4 "${pkgdir}/usr/lib/python2.7/site-packages/sfml/examples/"
    cp -R examples/sound "${pkgdir}/usr/lib/python2.7/site-packages/sfml/examples/"

    find "${pkgdir}/usr/lib/python2.7/site-packages/sfml/examples/" -iname "*.*" -exec chmod 644 {} +;

    # Copying the License file
    LICENSEFILE="${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    if [ ! -e $LICENSEFILE ]
    then
        install -D -m644 "$srcdir/python-sfml-$pkgver/COPYING" $LICENSEFILE
    fi
}
sha256sums=('24bf5c29eed525f4e81a43c1700ae37f6582e653fcb7f58ee41144b8cf46ce29')
