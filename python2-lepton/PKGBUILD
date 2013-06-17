# Maintainer: ikovac <ikovac at chammy dot info>
pkgname=python2-lepton
pkgver=1.0b2
pkgrel=1
pkgdesc="High-performance, pluggable particle engine and API for Python"
arch=('i686' 'x86_64')
url="https://code.google.com/p/py-lepton/"
license=('MIT')
depends=('python2>=2.5' 'mesa')
makedepends=('gcc')
source=("https://py-lepton.googlecode.com/files/lepton-$pkgver.tar.gz")
sha1sums=('639369c8524b17744a7096b25ca28aa4bbd4cbd3')

package() {
    cd "$srcdir/lepton-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    cd ..
    mkdir -p $pkgdir/usr/share/licenses/python2-lepton
    cp "$srcdir/lepton-$pkgver/LICENSE.txt" $pkgdir/usr/share/licenses/python2-lepton/LICENSE

}



