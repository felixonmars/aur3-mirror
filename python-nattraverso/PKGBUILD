# Contributor: William Rea <sillywilly@gmail.com>
pkgname=python-nattraverso
pkgver=0.1.1    
pkgrel=1
pkgdesc="A python library for NAT traversal"
url="https://nattraverso.python-hosting.com"
depends=('twisted' 'python-soappy')
conflicts=('nattraverso')
provides=('nattraverso')
replaces=('nattraverso')
source=(http://cheeseshop.python.org/packages/source/n/nattraverso/nattraverso-$pkgver.tar.gz)
md5sums=('96b9c39864db3587effc2859c5cc75b0')

build() {
  cd $startdir/src/nattraverso-$pkgver
  python setup.py install --root=$startdir/pkg
}
