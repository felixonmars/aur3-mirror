# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
pkgname=libasyncns-python
pkgver=0.7.1
pkgrel=1
pkgdesc="Python binding for the libasyncns asynchronous name service query library."
arch=(i686 x86_64)
url="https://launchpad.net/libasyncns-python"
license=('GPL')
depends=('libasyncns>=0.7' 'python')
makedepends=('gcc')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.bz2)
md5sums=('99c6595915efaf2309d52bed3c17f13d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

# vim:set ts=2 sw=2 et:
