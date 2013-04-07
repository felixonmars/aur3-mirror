# Maintainer: Jorge Araya Navarro <jorgean@lavabit.com>
pkgname=python-sfml2
pkgver=1.2
pkgrel=0
pkgdesc="Python 3 binding for SFML 2, written with Cython."
arch=('i686' 'x86_64')
url="http://openhelbreath.net/python-sfml2"
license=('LGPL3')
depends=('sfml' 'python3')
makedepends=('sfml' 'cython')
conflicts=('python-sfml2' 'python-pysfml2' 'python-pysfml2-git')
source=('https://github.com/Sonkun/python-sfml/archive/v1.2.zip')
optdepends=('pyqt: To use pysfml with Qt')

build() {
    cd "$srcdir/python-sfml-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/python-sfml-$pkgver"
    python3 setup.py install --root="${pkgdir}" --prefix=/usr

    # Copying the examples
    install -d -m755 "${pkgdir}/usr/lib/python3.2/site-packages/sfml/examples"
    cp -R examples/ "${pkgdir}/usr/lib/python3.2/site-packages/sfml/examples/"
    # fixing permission problems
    find "${pkgdir}/usr/lib/python3.2/site-packages/sfml/examples/" -iname "*.*" -exec chmod 644 {} +;

    # Copying the License file
    LICENSEFILE="${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    if [ ! -e $LICENSEFILE ]
    then
        install -D -m644 "$srcdir/python-sfml-$pkgver/COPYING" $LICENSEFILE
    fi
}
sha256sums=('24bf5c29eed525f4e81a43c1700ae37f6582e653fcb7f58ee41144b8cf46ce29')
