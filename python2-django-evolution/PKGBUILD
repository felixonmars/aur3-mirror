# Contributor: André Klitzing <aklitzing () gmail () com>

pkgname=python2-django-evolution
pkgver=0.7.4
pkgrel=1
pkgdesc="Schema Evolution for the Django Project"
arch=('any')
url="https://github.com/beanbaginc/django-evolution"
license=('BSD')
depends=('python2')
source=(https://github.com/beanbaginc/django-evolution/archive/release-${pkgver}.tar.gz)
sha256sums=('cc061cbc00b4741e8857f2380bce167f50717d3cb904896e6ce64961eb72c0a4')

package() {
    cd "$srcdir/django-evolution-release-${pkgver}"

    python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
