# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=satchmo
pkgver=0.8.1
pkgrel=1
pkgdesc="The webshop for perfectionists with deadlines"
arch=('any')
url="http://www.satchmoproject.com/"
license=('custom')
depends=('python' 'django')
source=("http://www.satchmoproject.com/snapshots/$pkgname-$pkgver.tar.gz")
md5sums=('3e7f13edfc717d88f754f475182072d6')

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build || return 1
  python setup.py install --root=$pkgdir --optimize=1 || return 1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
