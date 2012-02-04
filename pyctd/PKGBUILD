# Contributor: Ricardo 'richerVE' Hernández <richerve«at»archlinux.com.ve>
# Maintainer: Ricardo 'richerVE' Hernández <richerve«at»archlinux.com.ve>
pkgname=pyctd
pkgver=0.4.2
pkgrel=1
pkgdesc="NuConntrack is a XML-RPC service for monitoring and altering Netfilter connections for network admins."
arch=('i686' 'x86_64')
url="http://software.inl.fr/trac/wiki/NuConntrack"
license=('GPL')
depends=('python' 'pynetfilter_conntrack')
source=(http://cheeseshop.python.org/packages/source/p/$pkgname/${pkgname}-${pkgver}.tar.gz)
md5sums=('e338b3079149f0f369c446c1cd7ab326')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir || return 1

}

# vim:set ts=2 sw=2 et:
