# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=pasaffe
pkgver=0.43
pkgrel=1
pkgdesc="Easy to use password manager for Gnome with a Password Safe 3.0 compatible database."
arch=('any')
url="https://launchpad.net/pasaffe"
license=('GPL3')
depends=('apg' 'gtk3' 'pango' 'python-gobject' 'yelp')
makedepends=('python-distutils-extra')
install=$pkgname.install
source=(http://launchpad.net/pasaffe/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('9904a0a64ec13466cb2291474e94c611')

package() {
    cd $srcdir/$pkgname-$pkgver
    python setup.py install --root $pkgdir --optimize=1
}