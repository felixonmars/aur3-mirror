# Maintainer: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>
# Contributor: Brice Maron <brice@bmaron.net>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
# Contributor: Steven Allen <steven {at} stebalien {dot} com>

pkgname=python2-keyring
pkgver=4.0
pkgrel=1
pkgdesc="Store and access your passwords safely."
arch=(any)
url="http://pypi.python.org/pypi/keyring"
license=('PSF')
depends=('python2')
source=("http://pypi.python.org/packages/source/k/keyring/keyring-$pkgver.zip")
optdepends=('libgnome-keyring: Gnome integration'
            'python2-gobject: Gnome integration'
            'kdebindings-python2: Kde integration')
md5sums=('4d1055abcac582f11cb0941cf22ab4d0')

build() {
  cd "$srcdir/keyring-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/keyring-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
